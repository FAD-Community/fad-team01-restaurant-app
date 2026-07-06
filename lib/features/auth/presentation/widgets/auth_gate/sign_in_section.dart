import 'package:flutter/material.dart';

import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({super.key});

  void _navigate(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.loginscreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: () => _navigate(context),
          child: Text(
            'Sign in',
            style: AppTextStyles.bodySemiBold.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}