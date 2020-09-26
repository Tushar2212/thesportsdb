import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/ScreenSizeConfig.dart';
import 'package:flutter/material.dart';


class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSizeConfiguration.screenHeight*0.25,
      child: Center(
        child: Text(
            appTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}