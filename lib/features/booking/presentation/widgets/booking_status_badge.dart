import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/booking/data/models/booking_model.dart';

class BookingStatusBadge extends StatelessWidget {
  const BookingStatusBadge({super.key, required this.status});

  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color color;
    String text;

    switch (status) {
      case BookingStatus.upcoming:
        bg = const Color(0xffEDF9F1);
        color = const Color(0xff4CAF50);
        text = "Upcoming";
        break;

      case BookingStatus.pending:
        bg = const Color(0xffFFF4E5);
        color = const Color(0xffD4A017);
        text = "Pending";
        break;

      case BookingStatus.completed:
        bg = const Color(0xffF3F3F3);
        color = Colors.grey;
        text = "Completed";
        break;

      case BookingStatus.cancelled:
        bg = const Color(0xffFDECEC);
        color = Colors.red;
        text = "Cancelled";
        break;
    }

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          fontSize: 8.sp,
          color: color,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
