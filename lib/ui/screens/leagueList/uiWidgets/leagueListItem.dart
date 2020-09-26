import 'package:choppersample/model/league_res_model.dart';
import 'package:choppersample/model/sport_list_model.dart';
import 'package:choppersample/providers/countryProvider.dart';
import 'package:choppersample/utils/ScreenSizeConfig.dart';
import 'package:choppersample/utils/UtilFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LeagueListItem extends StatelessWidget {
  final League league;

  const LeagueListItem({this.league});

  @override
  Widget build(BuildContext context) {
    List<Sports> sportList = Provider.of<DataProvider>(context).sportsList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: ScreenSizeConfiguration.screenHeight * 0.15,
        child: Stack(children: [
          //Background Image
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: showImg(sportList
                .where((element) =>
                    league.strSport.compareTo(element.strSport) == 0)
                .elementAt(0)
                .strSportThumb),
          ),
          //Logo Image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: showImg(league.strLogo, 25, 75)),
          ),
          //League Title and FB,Twitter icons
          Container(
            color: Colors.transparent,
            child: ListTile(
              title: Text(
                league.strLeague,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Row(
                children: <Widget>[
                  showIcon('assets/icons/facebook.svg', league.strFacebook),
                  showIcon('assets/icons/twitter.svg', league.strTwitter),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }


  //Method to display Background/Logo
  Widget showImg(String pURL, [double pHeight, double pWidth]) => pURL != null
      ? showImage(pURL, pHeight, pWidth)
      : Container();

  //Method to display Icon
  Widget showIcon(String pAssetUrl, String pShowUrl) {
    return pShowUrl != null && pShowUrl.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: ScreenSizeConfiguration.screenWidth * 0.06,
              child: SvgPicture.asset(
                pAssetUrl,
                color: Colors.white,
              ),
            ),
          )
        : Container();
  }
}
