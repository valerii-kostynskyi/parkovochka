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
  tabBarTheme: const TabBarTheme(
    labelPadding: EdgeInsets.only(
      bottom: 13,
      top: 13,
    ),
    labelColor: Colors.text2,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.text2,
      letterSpacing: 0,
    ),
    unselectedLabelColor: Colors.text1,
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.text2,
        width: 1.0,
      ),
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
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.text1,
  ),
  primaryIconTheme: const IconThemeData(color: Colors.text2),
  iconTheme: const IconThemeData(
    color: Colors.text1,
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    backgroundColor: Colors.text1,
    collapsedIconColor: Colors.dividers,
    collapsedBackgroundColor: Colors.text1,
    collapsedTextColor: Colors.text1,
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
      color: Colors.text3,
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
  chipTheme: ChipThemeData(
    backgroundColor: Colors.text1,
    secondarySelectedColor: Colors.white,
    brightness: Brightness.light,
    secondaryLabelStyle: const TextStyle(
      color: Colors.text1,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    deleteIconColor: Colors.text1,
    disabledColor: Colors.text2.withOpacity(.5),
    selectedColor: Colors.primaryRed,
    padding: const EdgeInsets.only(
      bottom: 0,
    ),
    labelStyle: const TextStyle(
      color: Colors.text1,
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
  tabBarTheme: const TabBarTheme(
    labelPadding: EdgeInsets.only(
      bottom: 13,
      top: 13,
    ),
    labelColor: Colors.white,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 0,
    ),
    unselectedLabelColor: Colors.white,
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
    ),
  ),
);
