import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const mainColor = Color.fromARGB(255, 115, 105, 255);
  static const backColor = Color.fromARGB(255, 139, 143, 255);
  static const negro = Color.fromARGB(255, 0, 0, 0);
  static const words = Color.fromARGB(255, 6, 0, 85);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
    appBarTheme: const AppBarTheme(color: mainColor),
    textTheme: TextTheme(
      titleLarge:
          GoogleFonts.nunito(fontSize: 20.0, fontWeight: FontWeight.bold),
      headlineLarge: GoogleFonts.nunito(
        color: negro,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.nunito(
        color: words,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.nunito(
        color: negro,
        backgroundColor: mainColor,
      ),
    ),
  );
}
