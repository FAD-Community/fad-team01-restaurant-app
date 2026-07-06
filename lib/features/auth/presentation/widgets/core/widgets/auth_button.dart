import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 48.h,
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      child: Text(
        text,
        style: AppTextStyles.bodySemiBold.copyWith(color: AppColors.white),
      ),
    );
  }
}
