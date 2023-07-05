import 'package:parkovochka/style/colors.dart';
import 'package:flutter/material.dart' hide Colors;

final lightTheme = ThemeData(
  brightness: Brightness.light,
  shadowColor: Colors.shadow,
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
    onPrimary: Colors.primaryVariantBlue,
    secondary: Colors.primaryRed,
    onSecondary: Colors.primaryVariantRed,
    surface: Colors.surfaceGreyBlue,
    onSurface: Colors.surfaceGreyBlue,
    brightness: Brightness.light,
    outline: Colors.text2,
    tertiary: Colors.text1,
    onTertiary: Colors.darkBG,
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
  fontFamily: 'Raleway',
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
    // headlineMedium: TextStyle(
    //   color: Colors.text1,
    //   fontSize: 16,
    //   fontWeight: FontWeight.w500,
    // ),
    // labelMedium: TextStyle(
    //   color: Colors.primaryBlue,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    // ),
    // titleMedium: TextStyle(
    //   color: Colors.text1,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w500,
    // ),
    // bodyMedium: TextStyle(
    //   color: Colors.text2,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    // ),
    // bodyLarge: TextStyle(
    //   color: Colors.text3,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    // ),
    // titleSmall: TextStyle(
    //   color: Colors.white,
    //   fontWeight: FontWeight.w500,
    //   fontSize: 14,
    // ),
    // labelSmall: TextStyle(
    //   color: Colors.lightBG,
    //   fontSize: 14,
    //   letterSpacing: 0.25,
    //   fontWeight: FontWeight.w400,
    // ),
    bodySmall: TextStyle(
      color: Colors.text3,
      fontSize: 12,
      fontWeight: FontWeight.w100,
      letterSpacing: 0.04,
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
    shadowColor: Colors.shadow.withOpacity(0.15),
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
  shadowColor: Colors.shadow,
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
    onPrimary: Colors.primaryVariantBlue,
    secondary: Colors.primaryRed,
    onSecondary: Colors.primaryVariantRed,
    surface: Colors.surfaceGreyBlue,
    onSurface: Colors.surfaceGreyBlue,
    brightness: Brightness.light,
    outline: Colors.text2,
    tertiary: Colors.text1,
    onTertiary: Colors.darkBG,
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
  fontFamily: 'Raleway',
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
    // headlineMedium: TextStyle(
    //   color: Colors.text1,
    //   fontSize: 16,
    //   fontWeight: FontWeight.w500,
    // ),
    // labelMedium: TextStyle(
    //   color: Colors.primaryBlue,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    // ),
    // titleMedium: TextStyle(
    //   color: Colors.text1,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w500,
    // ),
    // bodyMedium: TextStyle(
    //   color: Colors.text2,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    // ),
    // bodyLarge: TextStyle(
    //   color: Colors.text3,
    //   fontSize: 14,
    //   fontWeight: FontWeight.w400,
    // ),
    // titleSmall: TextStyle(
    //   color: Colors.white,
    //   fontWeight: FontWeight.w500,
    //   fontSize: 14,
    // ),
    // labelSmall: TextStyle(
    //   color: Colors.lightBG,
    //   fontSize: 14,
    //   letterSpacing: 0.25,
    //   fontWeight: FontWeight.w400,
    // ),
    bodySmall: TextStyle(
      color: Colors.text3,
      fontSize: 12,
      fontWeight: FontWeight.w100,
      letterSpacing: 0.04,
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
    shadowColor: Colors.shadow.withOpacity(0.15),
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
