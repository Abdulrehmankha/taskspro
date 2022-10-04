import 'package:flutter/material.dart';


class MyTheme {
  static ThemeData lightTheme (BuildContext context) => ThemeData(
    primarySwatch: Colors.indigo,

  //  fontFamily: GoogleFonts.lato().fontFamily,
  );


  static ThemeData darkTheme (BuildContext context) => ThemeData(
    brightness: Brightness.dark,
  );
}

