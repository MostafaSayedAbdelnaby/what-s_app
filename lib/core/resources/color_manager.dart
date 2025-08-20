import 'package:flutter/material.dart';

abstract class ColorManager {
  static Color green = const Color(0xff168C4B);
  static Color green3 = const Color((0xFFDCF7C5));
  static Color containerGray = const Color(0xffDBE4ED);
  static Color black = const Color(0xff000000);
  static Color transparent = Colors.transparent;
  static Color white = const Color(0xffFFFFFF);

  static Color primary = const Color(0xFF0b1014); // dark theme in background
  static Color primaryDark = const Color(0xFF0F1C24);

  // Color(0xFF23282c); // dark theme in search

  static Color boNavBarDark =
      const Color(0xFF103629); // dark theme in ButtonNavBar
  static Color textChatDark = const Color(0xFF7c8185); // dark theme in txtChat
  static Color txtTitleDark = const Color(0xFFe0e3e6); // dark theme in txtTitle
  static Color fillDark = const Color(0xFF1C2D35); // dark theme in txtTitle

}
