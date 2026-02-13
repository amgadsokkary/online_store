import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/widget/custom_button.dart';
import 'package:online_store/core/widget/custom_text_form_field.dart';
import 'package:online_store/feature/home/cubit/product_cubit.dart';

class AddProducts extends StatelessWidget {
  final productName = TextEditingController();
  final productImage = TextEditingController();
  final productCategory = TextEditingController();
  final productPrice = TextEditingController();
  final productSize = TextEditingController();
  final productQuantity = TextEditingController();
  final productDetails = TextEditingController();
  final productReviews = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
              if (state is AddProductSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
                Navigator.of(context).pop(); // Go back to the previous screen
              } else if (state is ProductError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Column(
                spacing: 15,
                children: [
                  CustomTextFormField(
                    icon: Icons.shopping_cart,
                    hintText: "Product Name",
                    labelText: "Product Name",
                    controller: productName,
                  ),
                  CustomTextFormField(
                    icon: Icons.image,
                    hintText: "Product Image",
                    labelText: "Product Image",
                    controller: productImage,
                  ),
                  CustomTextFormField(
                    icon: Icons.category,
                    hintText: "Product Category",
                    labelText: "Product Category",
                    controller: productCategory,
                  ),
                  CustomTextFormField(
                    icon: Icons.attach_money,
                    hintText: "Product Price",
                    labelText: "Product Price",
                    controller: productPrice,
                  ),
                  CustomTextFormField(
                    icon: Icons.format_size,
                    hintText: "Product Size",
                    labelText: "Product Size",
                    controller: productSize,
                  ),
                  CustomTextFormField(
                    icon: Icons.production_quantity_limits,
                    hintText: "Product Quantity",
                    labelText: "Product Quantity",
                    controller: productQuantity,
                  ),
                  CustomTextFormField(
                    icon: Icons.description,
                    hintText: "Product Details",
                    labelText: "Product Details",
                    controller: productDetails,
                  ),
                  CustomTextFormField(
                    icon: Icons.rate_review,
                    hintText: "Product Reviews",
                    labelText: "Product Reviews",
                    controller: productReviews,
                  ),
                  // SizedBox(height: 100),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: state is ProductLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            bName: "Add Product",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ProductCubit>(
                                  context,
                                ).addProducts(
                                  name: productName.text,
                                  detail: productDetails.text,
                                  price: double.parse(productPrice.text),
                                  image: productImage.text,
                                  category: productCategory.text,
                                  size: productSize.text,
                                  quantity: int.parse(productQuantity.text),
                                  review: int.parse(productReviews.text),
                                );
                              }
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
