import 'package:flutter/material.dart';
import 'package:movie_app/common/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.grayColor,
      selectedItemColor: AppColor.yellowBg,
      unselectedItemColor: AppColor.white,
    ),
  );
}
