import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/styles_manager.dart';
import 'package:whats_app/core/theme/theme.dart';

class LightTheme extends BaseTheme {
  @override
  Color get backgroundColor => ColorManager.white;

  @override
  Color get greenColor => ColorManager.green;

  @override
  Color get textColor => ColorManager.black;

  @override
  ThemeData get themeData => ThemeData(
        primaryColor: greenColor,
        // splashColor: textColor, it causes black shadow on iconOfButtonNavBar
        // hoverColor: textColor,
        primaryColorLight: backgroundColor,
        focusColor: ColorManager.containerGray,
        dividerColor: ColorManager.green3,
        scaffoldBackgroundColor: backgroundColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: greenColor,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
              color: backgroundColor,
              width: 4,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          titleTextStyle: getMediumStyle(color: greenColor, fontSize: 22),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ColorManager.green,
          unselectedItemColor: ColorManager.black,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          backgroundColor: backgroundColor,
        ),
        // all font with 12 different in FontWeight
        textTheme: TextTheme(
          // w500
          titleSmall: getMediumStyle(color: textColor),
          // w300
          titleMedium: getLightStyle(color: textColor),
          // w400
          titleLarge: getRegularStyle(color: textColor),
          // w600
          bodySmall: getBoldStyle(color: textColor),
          // w700
          bodyMedium: getSemiBoldStyle(color: textColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: getRegularStyle(color: textColor, fontSize: 14),
          suffixIconColor: textColor,
          prefixIconColor: textColor,
          filled: true,
          fillColor: ColorManager.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      );
}
