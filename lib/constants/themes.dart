import 'package:burger/constants/colors.dart';
import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(mainColor),
      textStyle:
          MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 18.0)),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    ),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
    titleMedium: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
    titleLarge: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    ),
  ),
);
