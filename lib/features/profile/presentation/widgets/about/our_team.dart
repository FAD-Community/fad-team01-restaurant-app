import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OurTeam extends StatelessWidget {
  const OurTeam({
    super.key,
    required this.name,
    required this.title,
    required this.image,
  });

  final String name;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Image.asset(image),
            ),
            Gap(8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Gap(2.w),

                Text(
                  title,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
        Gap(8.w),

        Divider(
          indent: 1.w,
          endIndent: 1.w,
          height: 1.h,
          color: const Color(0xffEFE7DA),
        ),
      ],
    );
  }
}
