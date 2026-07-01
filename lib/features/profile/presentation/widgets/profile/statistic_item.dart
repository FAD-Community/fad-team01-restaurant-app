import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });

  final IconData icon;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112.w,
      height: 59.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff6A625B).withOpacity(.55),
            const Color(0xff4A443F).withOpacity(.55),
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16.sp, color: Colors.white70),
              SizedBox(width: 4.w),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Gap(4.h),

          Text(
            title,
            style: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w300,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
