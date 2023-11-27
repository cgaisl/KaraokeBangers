import 'package:flutter/material.dart';

final themeData = ThemeData(
// Set Poppins as the default font family
  fontFamily: 'Poppins',

// Set the default colors
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    onBackground: Colors.white,
    secondary: Colors.white,
  ),
  primaryColor: Colors.green,
  // To globally set the primary color

// Button style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      side: const BorderSide(color: Colors.white, width: 1),
      textStyle: const TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // Padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99),
      ),
    ),
  ),

  // TextButton style
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      // Background color
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 12), // Paddingunded corners
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),

  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.white38,
    selectionHandleColor: Colors.white,
  ),

  inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white70, width: 2.0),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white38),
      helperStyle: const TextStyle(color: Colors.white38),
      counterStyle: const TextStyle(color: Colors.white38),
      fillColor: Colors.grey[900],
      filled: true,
      errorStyle: const TextStyle(color: Colors.redAccent),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
      ),
      border: InputBorder.none),
);

final ButtonStyle alternativeElevatedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black,
  backgroundColor: Colors.white,
  textStyle: const TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
  ),
  side: const BorderSide(color: Colors.green, width: 0.01),
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  // Padding
);
