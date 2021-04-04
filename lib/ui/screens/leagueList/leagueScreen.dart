import 'package:choppersample/providers/connectivityProvider.dart';
import 'package:choppersample/providers/countryProvider.dart';
import 'package:choppersample/ui/screens/leagueList/uiWidgets/leagueListItem.dart';
import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/UtilFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_repo/bloc/events.dart';
import 'package:league_repo/bloc/league_bloc.dart';
import 'package:league_repo/bloc/states.dart';
import 'package:league_repo/league_repo.dart';
import 'package:provider/provider.dart';

class LeagueScreen extends StatefulWidget {
  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  String countryName;
  TextEditingController tfController = TextEditingController();
  LeagueBloc _leagueBloc;

  @override
  void initState() {
    super.initState();
    countryName = Provider.of<DataProvider>(context, listen: false).country;
    _leagueBloc = BlocProvider.of<LeagueBloc>(context, listen: false);
    _leagueBloc.add(LoadCountryLeagues(countryName));
  }

  @override
  void dispose() {
    super.dispose();
    tfController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ConnectivityProvider connectivityProvider =
        Provider.of<ConnectivityProvider>(context);
    getCurrentNetworkStatus()
        .then((value) => connectivityProvider.isConnectedToNetwork = value);
    return Scaffold(
      appBar: AppBar(
        title: Text(countryName),
      ),
      body: connectivityProvider.isConnectedToNetwork
          ? BlocBuilder<LeagueBloc, LeagueStates>(
              builder: (context, state) => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15.0),
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
                            if (text.isEmpty)
                              _leagueBloc.add(LoadCountryLeagues(countryName));
                            else
                              _leagueBloc.add(
                                LeagueSearch(countryName, text: text),
                              );
                          },
                        )),
                  ),
                  Expanded(
                    child: _getUi(state),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(noConnectionErrorMsg),
            ),
    );
  }

  Widget _getUi(LeagueStates state) {
    List<League> _leagues;
    switch (state.runtimeType) {
      case LeagueInit:
      case LeagueSearchLoading:
        return Center(
          child: CircularProgressIndicator(),
        );
        break;
      case LeaguesForCountryLoaded:
        _leagues = (state as LeaguesForCountryLoaded).leagues;
        continue leagueSearchDone;
      leagueSearchDone:
      case LeagueSearchDone:
        _leagues = _leagues ?? (state as LeagueSearchDone).leagues;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _leagues.length,
          itemBuilder: (_, index) => LeagueListItem(
            league: _leagues[index],
          ),
        );
      default:
        return Center(
          child: Text(noLeagueFoundErrorMsg),
        );
    }
    return Center(
      child: Text(noLeagueFoundErrorMsg),
    );
  }
}
