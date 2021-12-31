import 'package:flutter/material.dart';
import 'package:getx_restaurant/constants/color_constants.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.lavender,
      onPrimary: Colors.black,
      secondary: AppColors.spaceBlue,
      onSecondary: AppColors.spaceCadet,
      background: AppColors.babyPink,
    ),
  );

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
    primary: AppColors.spaceBlue,
    secondary: AppColors.burgundy,
    onSecondary: AppColors.spaceCadet,
    background: AppColors.spaceCadet,
  ));
}
