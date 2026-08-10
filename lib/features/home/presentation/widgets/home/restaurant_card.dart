import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';

class RestaurantCardHome extends StatelessWidget {
  const RestaurantCardHome({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      width: 320.w,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(22.r),
                ),
                child: Image.network(
                  restaurant.image,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 12.h,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Color(0xffB9622C),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Text(
                    '+ Free Welcome Drink',
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.grey[500],
                    size: 26.sp,
                  ),
                ),
              ),
            ],
          ),
          Gap(4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Gap(4),
                Text(
                  restaurant.name,
                  style: AppTextStyles.h2.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      restaurant.category,
                      style: AppTextStyles.captionMedium.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Gap(5),
                    Text('.'),
                    Gap(5),
                    Text(
                      restaurant.price,
                      style: AppTextStyles.captionMedium.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Gap(5),
                Row(
                  children: [
                    Icon(Icons.share_location_rounded, color: Colors.grey[400]),
                    Gap(4),
                    Text(
                      'New Cairo',
                      style: AppTextStyles.inline.copyWith(fontSize: 14.sp),
                    ),
                    Gap(12),
                    Icon(Icons.watch_later_outlined, color: Colors.grey[400]),
                    Gap(4),
                    Text(
                      '30 min',
                      style: AppTextStyles.inline.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
