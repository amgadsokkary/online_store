import 'package:flutter/material.dart';
import 'package:online_store/core/app_images.dart';
import 'package:online_store/core/app_styles.dart';
import 'package:online_store/presentation/screens/login.dart';
import 'package:online_store/presentation/widgets/custom_button.dart';
import 'package:online_store/presentation/widgets/custom_row.dart';
import 'package:online_store/presentation/widgets/custom_text_form_field.dart';

class Signup extends StatelessWidget {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.authBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppImages.logo, width: 150)),
                Text("Sign Up", style: AppStyles.headlineLarge),
                Text(
                  "Enter your credentials to continue",
                  style: AppStyles.bodyMedium,
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextFormField(
                      icon: Icons.person,
                      labelText: "Username",
                      controller: usernameController,
                    ),
                    CustomTextFormField(
                      icon: Icons.email,
                      labelText: "Email",
                      controller: emailController,
                    ),
                    CustomTextFormField(
                      icon: Icons.lock,
                      labelText: "Password",
                      controller: passwordController,
                      isPassword: true,
                    ),
                    CustomTextFormField(
                      icon: Icons.lock,
                      labelText: "Confirm Password",
                      controller: confirmPasswordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 20),
                    CustomButton(bName: "Sign Up", onPressed: () {}),
                    CustomRow(
                      textName: "Already have an account?",
                      textLink: "Login",
                      screenName: Login(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
