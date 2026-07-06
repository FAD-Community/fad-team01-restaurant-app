import 'package:flutter/material.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class OtpResendCode extends StatelessWidget {
  const OtpResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          "Didn't receive it? ",
          style: AppTextStyles.bodySecondary,
        ),

        GestureDetector(
          onTap: () {},

          child: Text(
            "Resend Code",
            style: AppTextStyles.body.copyWith(
              color: const Color(0xffB56A54),
              decoration: TextDecoration.underline,
            ),
          ),
        ),

      ],
    );
  }
}