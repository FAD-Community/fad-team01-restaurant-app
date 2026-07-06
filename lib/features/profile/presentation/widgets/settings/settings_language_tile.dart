import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/text_styles.dart';

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
                style: AppTextStyles.input.copyWith(
                  color: Color(0xff473426)
                )
              ),
            ),

            Text(
              language,
              style: AppTextStyles.caption.copyWith(
                  color: Color(0xff473426).withOpacity(0.8)
                )
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
