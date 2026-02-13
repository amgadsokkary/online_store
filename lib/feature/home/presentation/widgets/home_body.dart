import 'package:flutter/material.dart';
import 'package:online_store/core/app_images.dart';
import 'package:online_store/core/theme/app_colors.dart';
import 'package:online_store/core/theme/app_styles.dart';
import 'package:online_store/core/widget/custom_text_form_field.dart';
import 'package:online_store/feature/home/data/model/product_model.dart';
import 'package:online_store/feature/home/presentation/widgets/custom_product_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    List products = [
      ProductModel(
        name: "Red Apple",
        image: AppImages.apple,
        price: 4.99,
        quantity: 1,
        size: "1kg",
        id: 101,
        category: 'Fruits',
        detail:
            'Red Apple is a type of apple that is known for its vibrant red color and sweet flavor. It is one of the most popular apple varieties and is widely consumed around the world. Red Apples are typically crisp and juicy, making them perfect for eating fresh, as well as for use in cooking and baking. They are often used in salads, desserts, and various dishes to add a touch of sweetness and a pop of color.',
        review: 5,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        name: "Chille",
        image: AppImages.chille,
        price: 5.99,
        quantity: 1,
        size: "1kg",
        id: 100,
        category: 'Vegetables',
        detail:
            'Sweet Chille is a type of chili pepper that is known for its sweet and mild flavor. It is often used in cooking to add a touch of sweetness and a mild heat to dishes. Sweet Chille peppers are typically small and have a bright red or green color when ripe. They can be eaten raw, cooked, or pickled, and are commonly used in salads, salsas, and various cuisines around the world.',
        review: 4,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        name: "Red Apple",
        image: AppImages.apple,
        price: 4.99,
        quantity: 1,
        size: "1kg",
        id: 101,
        category: 'Fruits',
        detail:
            'Red Apple is a type of apple that is known for its vibrant red color and sweet flavor. It is one of the most popular apple varieties and is widely consumed around the world. Red Apples are typically crisp and juicy, making them perfect for eating fresh, as well as for use in cooking and baking. They are often used in salads, desserts, and various dishes to add a touch of sweetness and a pop of color.',
        review: 5,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        name: "Chille",
        image: AppImages.chille,
        price: 5.99,
        quantity: 1,
        size: "1kg",
        id: 100,
        category: 'Vegetables',
        detail:
            'Sweet Chille is a type of chili pepper that is known for its sweet and mild flavor. It is often used in cooking to add a touch of sweetness and a mild heat to dishes. Sweet Chille peppers are typically small and have a bright red or green color when ripe. They can be eaten raw, cooked, or pickled, and are commonly used in salads, salsas, and various cuisines around the world.',
        review: 4,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        name: "Red Apple",
        image: AppImages.apple,
        price: 4.99,
        quantity: 1,
        size: "1kg",
        id: 101,
        category: 'Fruits',
        detail:
            'Red Apple is a type of apple that is known for its vibrant red color and sweet flavor. It is one of the most popular apple varieties and is widely consumed around the world. Red Apples are typically crisp and juicy, making them perfect for eating fresh, as well as for use in cooking and baking. They are often used in salads, desserts, and various dishes to add a touch of sweetness and a pop of color.',
        review: 5,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        name: "Chille",
        image: AppImages.chille,
        price: 5.99,
        quantity: 1,
        size: "1kg",
        id: 100,
        category: 'Vegetables',
        detail:
            'Sweet Chille is a type of chili pepper that is known for its sweet and mild flavor. It is often used in cooking to add a touch of sweetness and a mild heat to dishes. Sweet Chille peppers are typically small and have a bright red or green color when ripe. They can be eaten raw, cooked, or pickled, and are commonly used in salads, salsas, and various cuisines around the world.',
        review: 4,
        createdAt: DateTime.now(),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image.asset(AppImages.logo),
              ),
            ),
            Text("Kuwait , Hawally"),
            CustomTextFormField(
              icon: Icons.search,
              controller: TextEditingController(),
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              fillColor: AppColors.border,
              filled: true,
            ),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.banner),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Exclusive Offer", style: AppStyles.headlineMedium),
                Text(
                  "View all",
                  style: AppStyles.bodyLarge.copyWith(color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomProductCard(product: products[index]),
                  );
                },
                itemCount: products.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Best Selling", style: AppStyles.headlineMedium),
                Text(
                  "View all",
                  style: AppStyles.bodyLarge.copyWith(color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomProductCard(product: products[index]),
                  );
                },
                itemCount: products.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
