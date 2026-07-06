import 'package:flutter/material.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Enter Code",
          style: AppTextStyles.h1,
        ),

        const SizedBox(height: 8),

        Text(
          "We sent a 4-digit code to your email",
          style: AppTextStyles.bodySecondary,
        ),

      ],
    );
  }
}