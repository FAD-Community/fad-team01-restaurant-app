import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class CustomButtonNer extends StatelessWidget {
  const CustomButtonNer({
    super.key,
    required this.text,
    required this.onPressed,

    this.backgroundColor = const Color(0xff8F1D21),
    required this.textColor,
    this.borderColor,
    this.isOutlined = false,
  });

  final String text;
  final VoidCallback onPressed;

  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.white : backgroundColor,

          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isOutlined
                ? (borderColor ?? Colors.black)
                : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            color: textColor,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
