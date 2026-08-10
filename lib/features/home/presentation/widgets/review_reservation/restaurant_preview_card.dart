import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';

class RestaurantPreviewCard extends StatelessWidget {
  const RestaurantPreviewCard({super.key, required this.restaurant});
  final RestaurantEntity restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            restaurant.image,
            height: 180.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: AppTextStyles.h2.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                Gap(4.h),
                Text(
                  '${restaurant.category},${restaurant.address}',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xffA89785),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
