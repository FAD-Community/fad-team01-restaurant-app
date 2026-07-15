import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ka3da/core/theme/colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.scaffoldBackgroundAlt,
      ),

      child: SvgPicture.asset("assets/discover/Faders.svg", width: 20.w),
    );
  }
}
