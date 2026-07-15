import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class RestaurantKeywords extends StatelessWidget {
  const RestaurantKeywords({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: const Color(0xffFAD7C4),
      ),
      child: Text(
        title,
        style: AppTextStyles.label.copyWith(fontWeight: FontWeight.w300),
      ),
    );
  }
}
