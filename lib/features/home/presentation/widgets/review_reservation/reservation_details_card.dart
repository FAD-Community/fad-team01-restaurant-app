import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class ReservationDetailsCard extends StatelessWidget {
  final String date;
  final String time;
  final String guests;

  const ReservationDetailsCard({
    super.key,
    required this.date,
    required this.time,
    required this.guests,
  });

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xffA89785),
            size: 22.sp,
          ),
          Gap(12.w),
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              fontSize: 15.sp,
              color: const Color(0xffA89785),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reservation Details',
            style: AppTextStyles.h2.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          Gap(8.h),
          _buildDetailRow(
            Icons.calendar_today_outlined,
            'Date',
            date,
          ),
          Divider(color: Colors.grey[200], height: 1),
          _buildDetailRow(
            Icons.access_time_outlined,
            'Time',
            time,
          ),
          Divider(color: Colors.grey[200], height: 1),
          _buildDetailRow(
            Icons.people_outline_rounded,
            'Party Size',
            guests,
          ),
        ],
      ),
    );
  }
}
