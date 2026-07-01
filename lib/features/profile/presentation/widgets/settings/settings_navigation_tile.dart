import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsNavigationTile extends StatelessWidget {
  const SettingsNavigationTile({
    super.key,
    required this.title,
    required this.onTap,
    this.showDivider = true,
    this.leading,
  });

  final String title;
  final VoidCallback onTap;
  final bool showDivider;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 18.h,
            ),
            child: Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  SizedBox(width: 12.w),
                ],

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff261C14),
                        ),
                  ),
                ),

                Icon(
                  Icons.chevron_right,
                  size: 16.sp,
                  color: const Color(0xff261C14),
                ),
              ],
            ),
          ),
        ),

        if (showDivider)
          Divider(
            height: 1,
            indent: 1.w,
            endIndent: 1.w,
            color: const Color(0xffF2ECE4),
          ),
      ],
    );
  }
}