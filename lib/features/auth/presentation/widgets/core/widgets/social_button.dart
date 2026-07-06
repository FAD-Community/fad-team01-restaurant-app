import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ka3da/core/theme/colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.asset,
    required this.onPressed,
  });

  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          asset,
          width: 24.w,
          height: 24.w,
        ),
      ),
    );
  }
}