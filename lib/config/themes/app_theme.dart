import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.secondary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: AppStrings.fontFamily,
      textTheme: TextTheme(
        headline1:TextStyle(
            fontSize: 20, color: AppColors.primary, fontWeight: FontWeight.w600),
        headline2: TextStyle(
            fontSize: 32, color: AppColors.black, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            fontSize: 14, color: AppColors.secondary, fontWeight: FontWeight.w300),
        bodyText1:  TextStyle(
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w400),
      ));
}
