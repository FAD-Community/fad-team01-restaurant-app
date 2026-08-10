import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffoldBackground,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: AppTextStyles.h2.copyWith(
              color: AppColors.textDark,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(8),
          Text(
            restaurant.description,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textMuted,
              fontSize: 15.sp,
              height: 1.6,
            ),
          ),
          Gap(20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CONTACT & LOCATION',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(16),
                Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: AppColors.textMuted,
                      size: 20.sp,
                    ),
                    Gap(10),
                    Text(
                      restaurant.phone,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textMuted,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                Divider(color: Colors.grey[200], height: 1),
                Gap(12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.textMuted,
                      size: 20.sp,
                    ),
                    Gap(10),
                    Expanded(
                      child: Text(
                        restaurant.address,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(24),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.reserveTabelScreen,
                arguments: restaurant,
              );
            },
            child: Text('Reserve Table', style: AppTextStyles.button),
          ),
        ],
      ),
    );
  }
}
