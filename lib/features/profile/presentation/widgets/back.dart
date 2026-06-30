import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Back extends StatelessWidget {
  const Back({super.key, this.iconColor});
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: iconColor ?? Color(0xffFAF3E6),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_outlined, size: 14.sp),
        ),
      ),
    );
  }
}
