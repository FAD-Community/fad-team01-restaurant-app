import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/notifications/data/models/notification_item.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left red line for unread
            if (item.isUnread)
              Container(
                width: 3.w,
                color: AppColors.primary,
              ),
            // Card Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Red Dot & Calendar Icon
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (item.isUnread)
                          Container(
                            width: 6.w,
                            height: 6.w,
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          )
                        else
                          Gap(14.w), // spacing to align icons if no dot

                        Container(
                          width: 38.w,
                          height: 38.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffF4EFE9),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            size: 18.sp,
                            color: item.isUnread
                                ? AppColors.textDark
                                : AppColors.textMuted.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                    Gap(14.w),
                    // Text Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: AppTextStyles.h2.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: item.isUnread
                                  ? AppColors.textDark
                                  : AppColors.textMuted.withValues(alpha: 0.5),
                            ),
                          ),
                          Gap(4.h),
                          Text(
                            item.body,
                            style: AppTextStyles.body.copyWith(
                              fontSize: 13.sp,
                              color: item.isUnread
                                  ? AppColors.textMuted
                                  : AppColors.textMuted.withValues(alpha: 0.4),
                              height: 1.4,
                            ),
                          ),
                          Gap(8.h),
                          Text(
                            item.time,
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 11.sp,
                              color: item.isUnread
                                  ? AppColors.textMuted.withValues(alpha: 0.8)
                                  : AppColors.textMuted.withValues(alpha: 0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
