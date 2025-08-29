import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:movie_app/core/theme/widget_themes/elevated_button_theme.dart';
import 'package:movie_app/core/theme/widget_themes/text_field_theme.dart';
import 'package:movie_app/core/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData darkAppTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: TColors.dark,
    fontFamily: 'Inter',
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    bottomNavigationBarTheme: BottomNavTheme.dark,

    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
