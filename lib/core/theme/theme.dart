import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xffF1F1F1),
    fontFamily: GoogleFonts.montserrat().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xff183867),
      onPrimary: Colors.white,
      secondary: const Color(0xffEAA121),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff183867),
        side: BorderSide(color: Colors.black),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: CircleBorder(),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffEAA121),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: Size(double.infinity, 56),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xff183867),
      foregroundColor: Colors.white,
      elevation: 4,
      extendedPadding: EdgeInsets.all(16),
      shape: const CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
      errorStyle: TextStyle(color: Colors.red),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      alignLabelWithHint: true,
      suffixIconColor: Colors.grey,
      prefixIconColor: Colors.grey,
      suffixStyle: TextStyle(color: Colors.grey),
      prefixStyle: TextStyle(color: Colors.grey),
    ),
    useMaterial3: true,
  );
}
