import 'package:flutter/material.dart';
import 'package:online_store/core/theme/app_colors.dart';

class GroceriesModel {
  final String? image;
  final String? name;
  final Color color;

  GroceriesModel({this.image, this.name, this.color = AppColors.primary});

  factory GroceriesModel.fromJson(Map<String, dynamic> json) {
    return GroceriesModel(
      image: json['image'] ?? "",
      name: json['name'] ?? "",
      color: AppColors.primary,
    );
  }
}
