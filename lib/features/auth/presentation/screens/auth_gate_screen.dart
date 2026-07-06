import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/features/auth/presentation/widgets/auth_gate/auth_gate_header.dart';
import 'package:ka3da/features/auth/presentation/widgets/auth_gate/continue_divider.dart';
import 'package:ka3da/features/auth/presentation/widgets/auth_gate/create_account_button.dart';
import 'package:ka3da/features/auth/presentation/widgets/auth_gate/guest_button.dart';
import 'package:ka3da/features/auth/presentation/widgets/auth_gate/sign_in_section.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/social_buttons.dart';


class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
             AuthGateHeader(),
             Gap(56.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  const CreateAccountButton(),

                  SizedBox(height: 32.h),

                  const ContinueDivider(),

                  SizedBox(height: 32.h),

                  const SocialButtons(),

                  SizedBox(height: 32.h),

                  const GuestButton(),

                  SizedBox(height: 24.h),

                  const SignInSection(),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}