import 'package:flutter/material.dart';
import 'package:globalinctasks/Utils/color_config.dart';


class MyTheme {
  static ThemeData lightTheme (BuildContext context) => ThemeData(
    primarySwatch: Colors.red,
    primaryColor: ColorConfig.primaryColor,
    secondaryHeaderColor: ColorConfig.secondaryColor
  );


  static ThemeData darkTheme (BuildContext context) => ThemeData(
    brightness: Brightness.dark,
  );
}

