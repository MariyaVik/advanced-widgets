import 'package:flutter/material.dart';
import 'package:skillbox_14_6/theme/color_palettes.dart';

final browmTheme = ThemeData(
  listTileTheme:
      ListTileThemeData(selectedTileColor: Brown.beige.withOpacity(0.5)),
  colorScheme: const ColorScheme(
    primary: Brown.brownDark,
    background: Brown.white,
    brightness: Brightness.light,
    error: Brown.errorColor,
    onBackground: Brown.black,
    onError: Brown.white,
    onPrimary: Brown.beige,
    secondary: Brown.brownLigth,
    onSecondary: Brown.white,
    surface: Brown.white,
    onSurface: Brown.black,
  ),
  // brightness: Brightness.dark,
  // primarySwatch: Brown.brownLigth,
  // scaffoldBackgroundColor: Colors.teal,
  // textTheme: const TextTheme(
  // displayLarge: TextStyle(
  // fontFamily: 'Corben',
  // fontWeight: FontWeight.w700,
  // fontSize: 24,
  // color: Colors.white,
  // ),
);

final purpleTheme = ThemeData(
  listTileTheme: const ListTileThemeData(selectedTileColor: Purple.cream),
  colorScheme: const ColorScheme(
    primary: Purple.purpleDark,
    background: Purple.cream,
    brightness: Brightness.light,
    error: Purple.errorColor,
    onBackground: Purple.black,
    onError: Purple.white,
    onPrimary: Purple.cream,
    secondary: Purple.purple,
    onSecondary: Purple.white,
    surface: Purple.white,
    onSurface: Purple.black,
  ),
);

final colorfulTheme = ThemeData(
  listTileTheme:
      ListTileThemeData(selectedTileColor: Colorful.yellow.withOpacity(0.3)),
  colorScheme: const ColorScheme(
    primary: Colorful.blueDark,
    background: Colorful.white,
    brightness: Brightness.light,
    error: Colorful.errorColor,
    onBackground: Colorful.blueDark,
    onError: Colorful.white,
    onPrimary: Colorful.yellow,
    secondary: Colorful.pink,
    onSecondary: Colorful.white,
    surface: Colorful.white,
    onSurface: Colorful.yellow,
  ),
);
