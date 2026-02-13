import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/app_images.dart';
import 'package:online_store/core/theme/app_colors.dart';
import 'package:online_store/core/widget/custom_text_form_field.dart';
import 'package:online_store/feature/home/cubit/product_cubit.dart';
import 'package:online_store/feature/home/presentation/widgets/custom_groceries_card.dart';
import 'package:online_store/feature/home/presentation/widgets/head_title.dart';
import 'package:online_store/feature/home/presentation/widgets/product_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            HeadTitle(title: "Exclusive Offer", onPressed: () {}),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductSuccess) {
                  return ProductList(products: state.products);
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                }
                return SizedBox();
              },
            ),
            HeadTitle(title: "Best Selling", onPressed: () {}),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductSuccess) {
                  return ProductList(products: state.products);
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                }
                return SizedBox();
              },
            ),
            HeadTitle(title: "Groceries", onPressed: () {}),
            CustomGroceriesCard(
              image: AppImages.apple,
              name: "Apple",
              color: Colors.red,
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductSuccess) {
                  return ProductList(products: state.products);
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
