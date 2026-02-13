import 'package:flutter/material.dart';
import 'package:online_store/core/theme/app_colors.dart';
import 'package:online_store/core/theme/app_styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.textName,
    required this.textLink,
    required this.screenName,
  });

  final String textName;
  final Widget screenName;
  final String textLink;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textName, style: AppStyles.bodyLarge),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => screenName),
            );
          },
          child: Text(
            textLink,
            style: AppStyles.bodyLarge.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
