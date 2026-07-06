import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashLogo extends StatelessWidget {

  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const SplashLogo({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          width: 180.w,
          height: 180.h,
          child: SvgPicture.asset(
            'assets/splash/logo_svg_no_bg.svg',
            width: 210.w,
            height: 210.h,
          ),
        ),
      ),
    );
  }
}