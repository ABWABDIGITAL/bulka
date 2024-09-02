import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

double borderRadius = 10;
ThemeData getLightTheme() => ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackGround,
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColors.transparent,
      ),
    );
