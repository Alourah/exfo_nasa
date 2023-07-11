import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/theme/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

//HOME

  static const boldButton = TextStyle(fontSize: 18, fontWeight: FontWeight.w700, height: 43 / 32);

//TILE

  static const titleTile =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 31 / 23, color: AppColors.bleuFonce2);

  static const descriptionTile = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.mauveGris4);

  static const dateTile = TextStyle(fontSize: 12, color: AppColors.gris4);

//DETAIL PAGE
  static const titleDetail =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 23 / 17, color: AppColors.bleuFonce2);

  static const descriptionDetail =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 23 / 17, color: AppColors.bleuFonce3);

  static const dateDetail =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 23 / 17, color: AppColors.gris4);
}
