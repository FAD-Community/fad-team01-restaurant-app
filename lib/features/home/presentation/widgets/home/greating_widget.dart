import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class GreetingAppbar extends StatelessWidget {
  const GreetingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good evening,👋',
          style: AppTextStyles.hint.copyWith(
            color: AppColors.textSecondary,
            fontSize: 13.sp,
          ),
        ),
        Gap(5),
    
        Text(
          'Where to tonight?',
          style: AppTextStyles.h1.copyWith(
            color: Color(0xff120D08),
            fontSize: 26.sp,
          ),
        ),
        Gap(5),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 15,
              color: AppColors.textMuted,
            ),
            Gap(4),
            Text(
              'New Cairo, Cairo, Egypt',
              style: AppTextStyles.hint.copyWith(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}