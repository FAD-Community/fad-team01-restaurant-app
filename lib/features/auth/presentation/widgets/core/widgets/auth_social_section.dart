import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/features/auth/presentation/widgets/auth_gate/continue_divider.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/social_buttons.dart';



class AuthSocialSection extends StatelessWidget {
  const AuthSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ContinueDivider(),

        SizedBox(height: 20.h),

        const SocialButtons(),
      ],
    );
  }
}