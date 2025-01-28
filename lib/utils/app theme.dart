import 'package:flutter/material.dart';
import 'package:news/utils/app%20colors.dart';
import 'package:news/utils/app%20styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.white,
    scaffoldBackgroundColor: AppColor.white,
    indicatorColor: AppColor.black,
    appBarTheme: const AppBarTheme(centerTitle: true,
        iconTheme: IconThemeData(
            color: AppColor.black
        ),
        backgroundColor: AppColor.white),
    textTheme: TextTheme(
        labelLarge: AppStyles.bold16Black,
        labelMedium: AppStyles.medium14Black,
        headlineLarge: AppStyles.medium20Black, //text of the app bar
        headlineMedium: AppStyles.medium24Black
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.black,
    scaffoldBackgroundColor: AppColor.black,
    indicatorColor: AppColor.white,
    appBarTheme: const AppBarTheme(centerTitle: true,
        iconTheme: IconThemeData(
            color: AppColor.white
        ),
        backgroundColor: AppColor.black),
    textTheme: TextTheme(
        labelLarge: AppStyles.bold16White,
        labelMedium: AppStyles.medium14White,
        headlineLarge: AppStyles.medium20White,
        headlineMedium: AppStyles.medium24White
    ),
  );

}