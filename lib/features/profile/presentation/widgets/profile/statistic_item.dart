import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });

  final IconData icon;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 112.w,
      height: 59.h,
      borderRadius: 12.r,
      blur: 8,
      border: 1,
      alignment: Alignment.center,
      linearGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xff6A625B).withOpacity(0.05),
          const Color(0xff4A443F).withOpacity(0.02),
        ],
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(.35),
          Colors.white.withOpacity(.08),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16.sp,
                color: Colors.white70,
              ),
              SizedBox(width: 4.w),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(
                  value,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Gap(4.h),
          Text(
            title,
            style: AppTextStyles.inline.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}