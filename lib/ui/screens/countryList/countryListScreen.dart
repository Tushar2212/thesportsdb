import 'package:chopper/chopper.dart';
import 'package:choppersample/model/sport_list_model.dart';
import 'package:choppersample/network/httpRequest.dart';
import 'package:choppersample/network/sportsApiService/sportsApiService.dart';
import 'package:choppersample/network/sportsHttpReq.dart';
import 'package:choppersample/providers/connectivityProvider.dart';
import 'package:choppersample/providers/countryProvider.dart';
import 'package:choppersample/ui/screens/countryList/uiWidgets/countryListWidget.dart';
import 'package:choppersample/uiWidgets/titleWidget.dart';
import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/ScreenSizeConfig.dart';
import 'package:choppersample/utils/UtilFunctions.dart';
import 'package:choppersample/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  SendHttpRequest _sendHttpRequest;
  DataProvider _dataProvider;
  SportListModel _sportListModel;
  @override
  void initState() {
    super.initState();
    _sendHttpRequest = SportsHttpRequest();
    _dataProvider = Provider.of<DataProvider>(context, listen: false);
    _getSportsList();
  }

  @override
  Widget build(BuildContext context) {

    ScreenSizeConfiguration().init(context);
    ConnectivityProvider connectivityProvider =
        Provider.of<ConnectivityProvider>(context);
    getCurrentNetworkStatus()
        .then((value) => connectivityProvider.isConnectedToNetwork = value);

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: connectivityProvider.isConnectedToNetwork
          ? SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TitleWidget(),
                  CountryListWidget(),
                ],
              ),
            )
          : Center(
              child: Text(noConnectionErrorMsg),
            ),
    );
  }

  _getSportsList() async {
    Response sportsList =
        await _sendHttpRequest.sendHttpRequest(SportsRQ(RequestType.GetSportsList));
    _sportListModel = sportsList.body;
    _dataProvider.sportsList = _sportListModel.sports;
  }
}
