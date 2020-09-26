import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/ScreenSizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryListItem extends StatelessWidget {
  final int index;
  final Function(int) onSelected;

  const CountryListItem(this.index, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(index);
        Navigator.pushNamed(context, '/LeagueScreen');
      },
      child: Container(
          height: ScreenSizeConfiguration.screenHeight * 0.05,
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  countryList[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: ScreenSizeConfiguration.screenWidth * 0.05,
                  child: SvgPicture.asset('assets/icons/arrow_right.svg'),
                ),
              ],
            ),
          )
          ),
    );
  }
}
