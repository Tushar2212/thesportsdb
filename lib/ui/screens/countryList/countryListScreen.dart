import 'package:chopper/chopper.dart';
import 'package:choppersample/model/sport_list_model.dart';
import 'package:choppersample/network/apiRequest.dart';
import 'package:choppersample/network/sportsApiService/sportsApiService.dart';
import 'package:choppersample/providers/connectivityProvider.dart';
import 'package:choppersample/providers/countryProvider.dart';
import 'package:choppersample/ui/screens/countryList/uiWidgets/countryListWidget.dart';
import 'package:choppersample/uiWidgets/titleWidget.dart';
import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/ScreenSizeConfig.dart';
import 'package:choppersample/utils/UtilFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  void initState() {
    super.initState();
    _getSportsList(Provider.of<SportsApiService>(context, listen: false),
        Provider.of<DataProvider>(context, listen: false));
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

  _getSportsList(
      SportsApiService pSportsApiService, DataProvider pDataProvider) async {
    Response<SportListModel> sportsList =
        await ApiRequest(pSportsApiService).sendRequest(SportsReq());
    pDataProvider.sportsList = sportsList.body.sports;
  }
}
