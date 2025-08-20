import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/styles_manager.dart';
import 'package:whats_app/core/theme/theme.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get backgroundColor => ColorManager.primary;

  @override
  Color get greenColor => ColorManager.boNavBarDark;

  @override
  Color get textColor => ColorManager.textChatDark;

  @override
  ThemeData get themeData => ThemeData(
        primaryColor: greenColor,
        hoverColor: ColorManager.fillDark,
        primaryColorLight: backgroundColor,
        focusColor: ColorManager.containerGray,
        dividerColor: ColorManager.green3,
        scaffoldBackgroundColor: ColorManager.primaryDark,
        //boNavBarDark
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
          backgroundColor: ColorManager.primaryDark,
          titleTextStyle:
              getMediumStyle(color: ColorManager.txtTitleDark, fontSize: 22),
          iconTheme: IconThemeData(
            color: ColorManager.txtTitleDark,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ColorManager.green,
          unselectedItemColor: ColorManager.txtTitleDark,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          backgroundColor:  ColorManager.primaryDark,
        ),
        // all font with 12 different in FontWeight
        textTheme: TextTheme(
          // w500
          titleSmall: getMediumStyle(color: ColorManager.textChatDark),
          // w300
          titleMedium: getLightStyle(color: ColorManager.white),
          // w400
          titleLarge: getRegularStyle(color: ColorManager.white),
          // w600
          bodySmall: getBoldStyle(color: ColorManager.white),
          // w700
          bodyMedium: getSemiBoldStyle(color: ColorManager.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle:
              getRegularStyle(color: ColorManager.textChatDark, fontSize: 18),
          suffixIconColor: textColor,
          prefixIconColor: ColorManager.textChatDark,
          filled: true,
          fillColor: ColorManager.fillDark,
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
