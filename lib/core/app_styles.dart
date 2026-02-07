import 'package:flutter/material.dart';
import 'package:online_store/core/app_colors.dart';

class AppStyles {
  static TextStyle headlineLarge = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineMedium = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static TextStyle hint = const TextStyle(
    fontSize: 14,
    color: AppColors.textHint,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle error = const TextStyle(
    fontSize: 14,
    color: AppColors.error,
  );
}
