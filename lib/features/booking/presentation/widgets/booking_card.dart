import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/booking/data/models/booking_model.dart';
import 'package:ka3da/features/booking/presentation/widgets/booking_status_badge.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 2,
          top: 8.5.h,
          bottom: 24.h,
          child: Container(
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 19, 158, 0),
                  blurRadius: 0,
                  spreadRadius: 6,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(133, 184, 184, 184),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 72.w,
                    height: 69.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.08),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Image.asset(
                        "assets/nearby/2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(10.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "The Grill House",
                                style: AppTextStyles.body,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gap(8.w),
                            BookingStatusBadge(status: BookingStatus.completed),
                          ],
                        ),
                        Text("Steakhouse", style: AppTextStyles.inline),
                        Gap(10.h),
                        Row(
                          children: [
                            Icon(Icons.date_range, size: 10),
                            Gap(2.w),
                            Text("June 25", style: AppTextStyles.inline),
                            Gap(8.w),

                            Icon(Icons.access_time, size: 10),
                            Gap(2.w),

                            Text("9:30 PM", style: AppTextStyles.inline),
                            Gap(8.w),

                            Icon(Icons.people, size: 10),
                            Gap(2.w),

                            Text("5", style: AppTextStyles.inline),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Divider(
                color: Colors.grey,
                thickness: 0.3,
                indent: 0.0,
                endIndent: 0.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Modify",
                          style: AppTextStyles.caption.copyWith(
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 22.h,
                    color: Colors.grey.shade300,
                  ),

                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                            size: 15.sp,
                          ),
                          Gap(5.w),
                          Text(
                            "Cancel",
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
