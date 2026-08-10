import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(width: 70.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xffFFF6F4),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18.sp, color: const Color(0xff1A130D)),
          Gap(8),
          Text(
            value,
            style: AppTextStyles.caption.copyWith(
              color: const Color(0xff1A130D),
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(4),
          Text(
            label,
            style: AppTextStyles.inline.copyWith(
              color: const Color(0xffB5A89E),
            ),
          ),
        ],
      ),
    );
  }
}
