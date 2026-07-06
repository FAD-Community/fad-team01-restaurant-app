import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutStatCard extends StatelessWidget {
  const AboutStatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });

  final String icon;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 95.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: const Color(0xffE3D6BA),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 18.w,
              height: 18.h,
              colorFilter: const ColorFilter.mode(
                Color(0xff261C14),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              value,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff261C14),
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff8E857D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}