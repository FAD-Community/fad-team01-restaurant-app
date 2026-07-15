import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class AlertNote extends StatelessWidget {
  final String text;

  const AlertNote({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline_rounded,
          color: const Color(0xffA33E32),
          size: 16.sp,
        ),
        Gap(6.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppTextStyles.bodyFont,
              fontSize: 12.sp,
              color: const Color(0xffA33E32),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
