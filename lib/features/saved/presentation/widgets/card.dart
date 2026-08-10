import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class SavedCard extends StatefulWidget {
  const SavedCard({super.key});

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 198, 198, 198),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ],
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
                child: SizedBox(
                  height: 180.h,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/splash/onb_3.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                right: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.center,
                  width: 32.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkBackground,
                        blurRadius: 30,
                        spreadRadius: 4,
                        offset: Offset(0, -10)
                      )
                    ],
                    color: const Color.fromARGB(4, 179, 179, 179),
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                right: 16.w,
                child: Container(
                  alignment: Alignment.center,
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceWhite,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 16),
                ),
              ),

              Positioned(
                bottom: 16.h,
                left: 16.w,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_outlined,
                      size: 12.sp,
                      color: AppColors.white,
                    ),
                    Gap(4.w),

                    Text(
                      "3.8",
                      style: AppTextStyles.captionMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Gap(4.w),

                    Text(
                      "(111)",
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(20.h),
          Row(
            children: [
              Gap(16.w),
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("The Grill House", style: AppTextStyles.bodyMedium),
                  Gap(6.h),
                  Row(
                    children: [
                      Text("Steakhouse", style: AppTextStyles.caption),
                      Text("  .  ", style: AppTextStyles.caption),

                      Text("EGP 350–600 pp", style: AppTextStyles.caption),
                    ],
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(Icons.location_pin, size: 12.sp),
                      Gap(4.w),

                      Text("New Cairo", style: AppTextStyles.inline),
                      Text(" . ", style: AppTextStyles.inline),
                      Text("30 min", style: AppTextStyles.inline),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16 ,),
                child: Container(
                  width: 93.w,

                  height: 40.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    "Reserve",
                    style: AppTextStyles.captionlarge.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(20.h),
        ],
      ),
    );
  }
}
