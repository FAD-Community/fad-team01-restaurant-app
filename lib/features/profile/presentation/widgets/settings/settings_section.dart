import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SettingsSections extends StatelessWidget {
  const SettingsSections({
    super.key,
    required this.title,
    required this.svgPath,
  });
  final String title;
  final String svgPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(svgPath, width: 16, height: 16),
        Gap(4.w),

        Text(title),
      ],
    );
  }
}
