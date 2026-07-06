import 'package:flutter/material.dart';

import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  void _continueAsGuest(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.mainLayout,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => _continueAsGuest(context),
      backgroundColor: AppColors.transparent,
      border: const BorderSide(
        color: Colors.black87,
      ),
      child: Text(
        'Continue as Guest',
        style: AppTextStyles.bodySemiBold.copyWith(
          color: AppColors.textDark,
        ),
      ),
    );
  }
}