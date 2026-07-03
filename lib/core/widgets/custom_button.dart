import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final BorderSide? border;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = const Color(0xFF8B2527),
    this.width = double.infinity,
    this.height,
    this.borderRadius = 16.0,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56.h,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: border ?? BorderSide.none,
          ),
          elevation: 0,
        ),
        child: child,
      ),
    );
  }
}
