import 'package:flutter/material.dart';


Color colorbar = const Color(0xff597d9b);
Color colorbar1 = const Color(0xF036506B);
Color colorbar2 = const Color(0xFF587D99);
Color colorText = const Color(0xff01305a);
Color colorText1 = const Color(0xfffcf0f0);
Color colorIcon = const Color(0xfff0d68c);
Color colorbody = const Color(0xffe0bb8b);
Color colorContainer=Colors.grey.shade200;

Color tryy = const Color(0xfff8eacd);
final appTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: colorbody,
      centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: colorbody,
    colorScheme: ColorScheme.light(primary: colorbody),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: colorbody),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorbody,
      foregroundColor: colorbar,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(
          color: colorText,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorbar),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: colorbar),
            borderRadius: BorderRadius.circular(8))));
