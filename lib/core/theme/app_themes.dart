import 'package:flutter/material.dart';

import '../widgets/app_border_radius.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData dark = ThemeData(
    primaryColorDark: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.progressIndicatorColor),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(brightness: Brightness.dark, primary: AppColors.primaryColor, secondary: AppColors.secondaryColor),
    textTheme: _textThemes,
    useMaterial3: false,
    elevatedButtonTheme: _elevatedButtonThemeData,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        titleTextStyle: _textThemes.titleMedium,
        iconTheme: const IconThemeData(color: AppColors.appBarIconColor)),
  );

  static ThemeData light = ThemeData(
    primaryColorDark: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    brightness: Brightness.light,
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.progressIndicatorColor),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(brightness: Brightness.light, primary: AppColors.primaryColor, secondary: AppColors.secondaryColor),
    primaryTextTheme: Typography.blackCupertino,
    textTheme: _textThemes,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    elevatedButtonTheme: _elevatedButtonThemeData,
    useMaterial3: false,
  );

  static TextTheme get _textThemes {
    return TextTheme(
      displayLarge: TextStyle(fontSize: 112.0, fontWeight: FontWeight.bold, color: AppColors.textColor),
      displayMedium: TextStyle(fontSize: 56.0, fontWeight: FontWeight.bold, color: AppColors.textColor),
      displaySmall: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold, color: AppColors.textColor),
      headlineLarge: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: AppColors.textColor),
      headlineMedium: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: AppColors.textColor),
      headlineSmall: TextStyle(fontSize: 18.0, color: AppColors.textColor),
      titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800, color: AppColors.textColor),
      titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800, color: AppColors.textColor),
      titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.textColor),
      bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.textColor),
      bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.textColor),
      bodySmall: TextStyle(fontSize: 12.0, color: AppColors.textColor),
      labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.textColor),
      labelMedium: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, color: AppColors.textColor),
      labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500, color: AppColors.textColor),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(46),
              backgroundColor: AppColors.primaryColor,
              shadowColor: AppColors.primaryColor,
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.circularSizeMediumValueRadius()))
          .copyWith(
        backgroundBuilder: (context, states, child) {
          return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: AppColors.elevatedButtonShadowColors,
                ),
                borderRadius: AppBorderRadius.circularSizeMediumValueRadius(),
                boxShadow: const [BoxShadow(color: AppColors.primaryColor, offset: Offset(0, 0), blurRadius: 20)],
              ),
              child: child);
        },
      ),
    );
  }
}
