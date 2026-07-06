import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopCurveClipper extends StatelessWidget {
  const TopCurveClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320.h,
      child: SvgPicture.asset(
        "assets/splash/TopCurve.svg",
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
