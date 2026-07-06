import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/widgets/custom_back_button.dart';

import 'auth_subtitle.dart';
import 'auth_title.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBackPressed,
  });

  final String title;
  final String subtitle;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(
          onPressed: onBackPressed,
        ),

        SizedBox(height: 24.h),

        AuthTitle(title),

        SizedBox(height: 4.h),

        AuthSubtitle(subtitle),
      ],
    );
  }
}