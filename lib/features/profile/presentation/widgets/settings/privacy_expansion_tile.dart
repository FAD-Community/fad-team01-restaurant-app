import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyExpansionTile extends StatelessWidget {
  const PrivacyExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.showDivider = true,
  });

  final String title;
  final String content;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(
            context,
          ).copyWith(dividerColor: const Color.fromARGB(0, 255, 255, 255)),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
            childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xff261C14),
                fontWeight: FontWeight.w300,
              ),
            ),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w300,

                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),

        if (showDivider) Divider(height: 1, indent: 16.w, endIndent: 16.w),
      ],
    );
  }
}
