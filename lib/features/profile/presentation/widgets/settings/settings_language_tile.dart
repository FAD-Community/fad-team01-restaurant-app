import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SettingsLanguageTile extends StatelessWidget {
  const SettingsLanguageTile({
    super.key,
    required this.language,
    required this.onTap,
  });

  final String language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Language",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff261C14),
                ),
              ),
            ),

            Text(
              language,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                color: const Color(0xff261C14),
              ),
            ),

            SizedBox(width: 8.w),

            Icon(Icons.keyboard_arrow_down, size: 16.sp),
            Gap(2.w)
          ],
        ),
      ),
    );
  }
}
