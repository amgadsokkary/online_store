import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/app_images.dart';
import 'package:online_store/core/theme/app_styles.dart';
import 'package:online_store/feature/auth/cubit/appauth/app_auth_cubit.dart';
import 'package:online_store/feature/home/presentation/screens/homepage.dart';
import 'package:online_store/feature/auth/presentation/screens/signup.dart';
import 'package:online_store/core/widget/custom_button.dart';
import 'package:online_store/feature/auth/presentation/widgets/custom_row.dart';
import 'package:online_store/core/widget/custom_text_form_field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthState>(
      listener: (context, state) {
        if (state is AppAuthSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        }
        if (state is AppAuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
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
                    Text("Logging", style: AppStyles.headlineLarge),
                    Text(
                      "Enter your emails and password",
                      style: AppStyles.bodyMedium,
                    ),
                    SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style: AppStyles.bodyLarge,
                          ),
                        ),
                        state is AppAuthLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                                bName: "Login",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<AppAuthCubit>(
                                      context,
                                    ).login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                        CustomRow(
                          textName: "Don’t have an account?",
                          textLink: "SingUp",
                          screenName: Signup(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
