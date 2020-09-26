import 'package:flutter/widgets.dart';

class ScreenSizeConfiguration
{
  static MediaQueryData _mediaQuery;
  static double _screenWidth;
  static double get screenWidth => _screenWidth;
  static double _screenHeight;
  static double get screenHeight => _screenHeight;
  static double _unitSizeHorizontal;
  static double get unitSizeHorizontal => _unitSizeHorizontal;
  static double _unitSizeVertical;
  static double get unitSizeVertical => _unitSizeVertical;
  static double textScale ;

   void init(BuildContext context)
  {
    _mediaQuery = MediaQuery.of(context);
    textScale = _mediaQuery.textScaleFactor;
    _screenWidth = _mediaQuery.size.width;
    _screenHeight = _mediaQuery.size.height;
    _unitSizeVertical = _screenHeight/100;
    _unitSizeHorizontal = _screenWidth/100;

  }
}