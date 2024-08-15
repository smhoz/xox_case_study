import 'package:flutter/material.dart';

final class AppColors {
  static const brightness = Brightness.dark;

  static bool get isDarkMode => brightness == Brightness.dark;

  static const primaryColor = Color(0xFF25D366);
  static const secondaryColor = Color(0xFF10191F);
  static Color get scaffoldBackgroundColor => isDarkMode ? const Color(0xFF10191F) : Colors.white;
  Color cardBackgroundColor = isDarkMode ? const Color(0xFF131E27) : const Color.fromRGBO(195, 229, 206, 1);
  static Color textColor = isDarkMode ? Colors.white : Colors.black;
  static const buttonColor = Color(0xFF10191F);
  static Color bottomNavBarColor = !isDarkMode ? primaryColor : const Color(0xFF131E27);
  static Color bottomNavBarIconColor = isDarkMode ? primaryColor : const Color(0xFF131E27);
  static Color progressIndicatorColor = isDarkMode ? primaryColor : const Color(0xFF131E27);
  static List<Color> elevatedButtonShadowColors = [const Color(0xFF13AE4D), const Color(0xFF36EE7A)];

  static const iconColor = Color(0xFF10191F);
  static const appBarIconColor = Colors.white;
  static const errorColor = Colors.red;
  static const errorColorLight = Color(0xFFF65E5B);

  //App Text Form Field
  static const appTextFormFieldShadowColor = Colors.black;
  static const appTextFormFieldBgColor = Color(0xFF131E27);
  static const appTextHintStyleColor = Colors.white70;

  //Home View
  static Color get homeBottomTextureColor => const Color(0xFF10191F);
}
