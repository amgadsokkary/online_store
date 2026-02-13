import 'package:flutter/material.dart';
import 'package:online_store/core/theme/app_styles.dart';
import 'package:online_store/feature/home/data/model/groceries_model.dart';

class CustomGroceriesCard extends StatelessWidget {
  final GroceriesModel groceries;

  const CustomGroceriesCard({super.key, required this.groceries});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 250,
      decoration: BoxDecoration(
        color: groceries.color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(groceries.image ?? "", height: 80, width: 80),
            SizedBox(width: 16),
            Text(groceries.name ?? "", style: AppStyles.headlineMedium),
          ],
        ),
      ),
    );
  }
}
