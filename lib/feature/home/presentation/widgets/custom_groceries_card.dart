import 'package:flutter/material.dart';
import 'package:online_store/core/theme/app_styles.dart';
import 'package:online_store/feature/home/data/model/groceries_model.dart';

class CustomGroceriesCard extends StatelessWidget {
  final String image;
  final String name;
  final Color color;

  const CustomGroceriesCard({
    super.key,
    required this.image,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 105,
              width: 250,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(image, height: 80, width: 80),
                    SizedBox(width: 16),
                    Text(name, style: AppStyles.headlineMedium),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
