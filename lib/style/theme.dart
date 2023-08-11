import 'package:parkovochka/style/colors.dart';
import 'package:flutter/material.dart' hide Colors;

final lightTheme = ThemeData(
  brightness: Brightness.light,
  shadowColor: Colors.text3,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  dividerColor: Colors.dividers,
  hintColor: Colors.dividers,
  unselectedWidgetColor: Colors.primaryBlue,
  indicatorColor: Colors.successful,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.text1),
  colorScheme: const ColorScheme(
    tertiaryContainer: Colors.warning,
    background: Colors.white,
    onBackground: Colors.text1,
    error: Colors.error,
    onError: Colors.errorWithOpacity,
    primary: Colors.primaryBlue,
    onPrimary: Colors.primaryBlue,
    secondary: Colors.primaryRed,
    onSecondary: Colors.primaryRed,
    surface: Colors.text3,
    onSurface: Colors.text3,
    brightness: Brightness.light,
  ),
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
  primaryIconTheme: const IconThemeData(color: Colors.text2),
  iconTheme: const IconThemeData(color: Colors.white),
  expansionTileTheme: const ExpansionTileThemeData(
    backgroundColor: Colors.white,
    collapsedIconColor: Colors.dividers,
    collapsedBackgroundColor: Colors.white,
    collapsedTextColor: Colors.white,
    iconColor: Colors.dividers,
    tilePadding: EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 16,
    ),
  ),
  fontFamily: 'Monserat',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.primaryBlue,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: Colors.text2,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: TextStyle(
      color: Colors.text2,
      fontSize: 24,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: TextStyle(
      color: Colors.text1,
      fontSize: 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w300,
    ),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
        color: Colors.text1,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.white,
    secondarySelectedColor: Colors.text2,
    brightness: Brightness.light,
    secondaryLabelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    deleteIconColor: Colors.white,
    disabledColor: Colors.text2.withOpacity(.5),
    selectedColor: Colors.primaryRed,
    padding: const EdgeInsets.only(
      bottom: 0,
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 2,
    shadowColor: Colors.text3.withOpacity(0.15),
    toolbarHeight: 56,
    iconTheme: const IconThemeData(color: Colors.text1),
    titleTextStyle: const TextStyle(
      color: Colors.text1,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.light,
  shadowColor: Colors.text3,
  scaffoldBackgroundColor: Colors.text1,
  cardColor: Colors.text1,
  dividerColor: Colors.dividers,
  hintColor: Colors.dividers,
  unselectedWidgetColor: Colors.primaryBlue,
  indicatorColor: Colors.successful,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  colorScheme: const ColorScheme(
    tertiaryContainer: Colors.warning,
    background: Colors.text1,
    onBackground: Colors.white,
    error: Colors.error,
    onError: Colors.errorWithOpacity,
    primary: Colors.primaryBlue,
    onPrimary: Colors.primaryBlue,
    secondary: Colors.primaryRed,
    onSecondary: Colors.primaryRed,
    surface: Colors.text3,
    onSurface: Colors.text3,
    brightness: Brightness.light,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.text1,
  ),
  primaryIconTheme: const IconThemeData(color: Colors.text2),
  iconTheme: const IconThemeData(
    color: Colors.text1,
  ),
  fontFamily: 'Monserat',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.primaryBlue,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 24,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: Colors.text1,
      fontSize: 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w300,
    ),
    headlineMedium: TextStyle(
      color: Colors.text1,
      fontSize: 18,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w300,
    ),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.text1,
    elevation: 2,
    shadowColor: Colors.text3.withOpacity(0.15),
    toolbarHeight: 56,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
);
