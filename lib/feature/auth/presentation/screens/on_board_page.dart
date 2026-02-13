import 'package:flutter/material.dart';
import 'package:online_store/core/theme/app_styles.dart';
import 'package:online_store/feature/auth/presentation/screens/login.dart';
import 'package:online_store/core/widget/custom_button.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/on_board_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Image.asset("assets/images/logo_white.png"),
                SizedBox(height: 20),
                Text(
                  "     Welcome \n to Online Store",
                  style: AppStyles.headlineLarge.copyWith(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                Text(
                  "Ger your groceries in as fast as one hour",
                  style: AppStyles.bodyMedium.copyWith(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 60.0,
                    horizontal: 20.0,
                  ),
                  child: CustomButton(
                    bName: "Get Started",
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
