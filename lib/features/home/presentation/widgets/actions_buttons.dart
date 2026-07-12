import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications_none_sharp,
            size: 28.sp,
          ),
        ),
        Gap(10),
        CircleAvatar(
          radius: 28.sp,
          child: Icon(Icons.person, size: 28.sp),
        ),
      ],
    );
  }
}