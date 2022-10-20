import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);
  static const Color primaryColor = Color(0xFFF0F2F5);
  static const MaterialColor swatch = MaterialColor(0xFFF0F2F5, {
    50: Color(0xFFF0F2F5),
    60: Color(0xFFF0F2F5),
    70: Color(0xFFF0F2F5),
    80: Color(0xFFF0F2F5),
    90: Color(0xFFF0F2F5),
    100: Color(0xFFF0F2F5),
    200: Color(0xFFF0F2F5),
    300: Color(0xFFF0F2F5),
    400: Color(0xFFF0F2F5),
    500: Color(0xFFF0F2F5),
    600: Color(0xFFF0F2F5),
    700: Color(0xFFF0F2F5),
    800: Color(0xFFF0F2F5),
    900: Color(0xFFF0F2F5),
  });

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color appBarBackgroundColor = Color(0xFFFFFFFF);
  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
