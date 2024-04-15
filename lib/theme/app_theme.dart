import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const mainColor = Color.fromARGB(215, 39, 169, 255);
  static const backColor = Color.fromARGB(255, 16, 34, 77);
  static const bottom = Color.fromARGB(255, 10, 21, 44);
  static const unactive = Color.fromARGB(255, 122, 122, 122);
  static const negro = Color.fromARGB(255, 0, 0, 0);
  static const words = Color.fromARGB(255, 236, 234, 255);
  static const blanco = Color.fromARGB(255, 255, 255, 255);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
    appBarTheme: const AppBarTheme(color: mainColor),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.abel(
        color: words,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: GoogleFonts.nunito(
        color: words,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.nunito(
        color: words,
        fontSize: 20,
      ),
      bodySmall: GoogleFonts.nunito(
        color: blanco,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.nunito(
        color: words,
      ),
      titleMedium: GoogleFonts.abel(
        color: mainColor,
        fontSize: 30,
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}
