import 'package:flutter/material.dart';
import 'package:nichrome_test/utils/theme/custom_themes/elevated_button_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class XAppTheme {
  XAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(255, 30, 150, 210),
      textTheme: XTextTheme.lightTextTheme,
      chipTheme: XChipTheme.lightChipTheme,
      scaffoldBackgroundColor: Colors.grey[300],
      appBarTheme: XAppBarTheme.lightAppBarTheme,
      checkboxTheme: XCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: XBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: XElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: XOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: XTextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(255, 30, 150, 210),
      textTheme: XTextTheme.lightTextTheme,
      chipTheme: XChipTheme.lightChipTheme,
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
      appBarTheme: XAppBarTheme.darkAppBarTheme,
      checkboxTheme: XCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: XBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: XElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: XOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: XTextFormFieldTheme.darkInputDecorationTheme);
}
