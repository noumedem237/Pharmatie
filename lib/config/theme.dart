import 'package:flutter/material.dart';
import 'package:pharma/config/config.dart';

class ThemeApp {
  static lightTheme() {
    return ThemeData(
        primaryColor: Palette.primaryColor,
        // primaryColor: Color(0x8B008B00),
        shadowColor: Colors.black,
        // shadowColor: ColorSwatch(),
        iconTheme: IconThemeData(
          // color: Colors.black,
        ),
        appBarTheme: AppBarTheme(
            // backgroundColor: Colors.white,
            // iconTheme: IconThemeData(color: Colors.black)
        ),
        primarySwatch: Palette.swatch
    );
  }
}
