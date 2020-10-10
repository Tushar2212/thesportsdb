import 'package:chopper/chopper.dart';
import 'package:choppersample/model/league_res_model.dart';
import 'package:choppersample/model/sport_list_model.dart';
import 'package:choppersample/network/httpRequest.dart';
import 'package:choppersample/network/leagueApiService/leagueApiService.dart';
import 'package:choppersample/network/sportsHttpReq.dart';
import 'package:choppersample/providers/connectivityProvider.dart';
import 'package:choppersample/providers/countryProvider.dart';
import 'package:choppersample/ui/screens/leagueList/uiWidgets/leagueListItem.dart';
import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/UtilFunctions.dart';
import 'package:choppersample/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeagueScreen extends StatefulWidget {
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  String countryName;
  Future<List<League>> leagueList;
  List<Sports> sportList;
  TextEditingController tfController = TextEditingController();
  ValueNotifier<Future<List<League>>> leagueListChange;
  SendHttpRequest _sendHttpRequest;
  @override
  void initState() {
    super.initState();
    _sendHttpRequest = LeagueHttpRequest();
    countryName = Provider.of<DataProvider>(context, listen: false).country;
    leagueList = _sendRequest(
      countryName,
      RequestType.GetLeagues,
    );
    leagueListChange = ValueNotifier(leagueList);
  }

  @override
  void dispose() {
    super.dispose();
    tfController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ConnectivityProvider connectivityProvider = Provider.of<ConnectivityProvider>(context);
    getCurrentNetworkStatus()
        .then((value) => connectivityProvider.isConnectedToNetwork = value);
    return Scaffold(
      appBar: AppBar(
        title: Text(countryName),
      ),
      body:connectivityProvider.isConnectedToNetwork ? Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 15.0),
            child: Container(
                height: 40,
                child: TextField(
                  controller: tfController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5.0)),
                      hintText: 'Search Leagues...',
                      contentPadding: EdgeInsets.only(left: 8.0),
                      filled: true,
                      fillColor: Colors.grey[300],
                      ),
                  onSubmitted: (text) {
                    print(text);
                  },
                  onChanged: (text) {
                    leagueListChange.value = _sendRequest(
                        countryName, RequestType.SearchLeague, text);
                  },
                )),
          ),
          ValueListenableBuilder(
            valueListenable: leagueListChange,
            builder: (_, leagueListChangeVal, __) {
              return FutureBuilder(
                  future: leagueListChangeVal,
                  builder: (context, dataSnapShot) {

                    if (dataSnapShot.connectionState == ConnectionState.done &&
                        (dataSnapShot.hasData == null || (dataSnapShot.data as List<League>) == null))
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(noLeagueFoundErrorMsg),
                        ),
                      );
                    return Expanded(
                      child: dataSnapShot.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: dataSnapShot.data.length,
                              itemBuilder: (_, index) => LeagueListItem(
                                league: dataSnapShot.data[index],
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    );
                  });
            },
          ),
        ],
      ) : Center(child: Text(noConnectionErrorMsg),),
    );
  }

  Future<List<League>> _sendRequest(String pCountry, RequestType pReqType,
      [String pSearchText]) async {
    Response leagueList =
        await _sendHttpRequest.sendHttpRequest(LeagueReq(s: pSearchText, c: pCountry, reqType: pReqType));
    return leagueList.body.countrys;
  }

}
