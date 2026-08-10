import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class OtpVerifyButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
  const OtpVerifyButton({super.key, required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 48.h,
      backgroundColor: enabled ? AppColors.primary : AppColors.progressInactive,

      onPressed: enabled
          ? onTap
          : () {},

      child: Text(
        "Verify",
        style: AppTextStyles.body.copyWith(
          color: enabled ? Colors.white : Color(0xff120D08).withOpacity(0.6),
        ),
      ),
    );
  }
}
