import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme () {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const  Color.fromRGBO(99, 205, 255, 1)
      )
    ),
    textTheme: GoogleFonts.plusJakartaSansTextTheme(),
  );
}