import 'package:choppersample/providers/connectivityProvider.dart';
import 'package:choppersample/providers/countryProvider.dart';
import 'package:choppersample/ui/screens/countryList/countryListScreen.dart';
import 'package:choppersample/ui/screens/leagueList/leagueScreen.dart';
import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/UtilFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_repo/bloc/league_bloc.dart';
import 'package:league_repo/league_repo.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setUpLogging();

  runApp(MyApp());
}

ConnectivityProvider _setUpNetworkStatus() {
  ConnectivityProvider connectivityProvider = ConnectivityProvider();
  getCurrentNetworkStatus()
      .then((value) => connectivityProvider.isConnectedToNetwork = value);
  return connectivityProvider;
}

void _setUpLogging() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((data) {
    print('${data.time} : ${data.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConnectivityProvider(),
        ),
        Provider(
          create: (_) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => CountryListScreen(),
          '/LeagueScreen': (context) => BlocProvider(
                create: (_) => LeagueBloc(
                  LeagueHttpClient(baseUrl),
                ),
                child: LeagueScreen(),
              ),
        },
      ),
    );
  }
}
