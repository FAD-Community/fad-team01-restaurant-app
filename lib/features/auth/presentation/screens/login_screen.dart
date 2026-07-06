import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_footer.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_social_section.dart';
import 'package:ka3da/features/auth/presentation/widgets/login/login_form.dart';
import 'package:ka3da/features/auth/presentation/widgets/login/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),

              SizedBox(height: 32.h),

              const LoginForm(),

              SizedBox(height: 24.h),

              const AuthSocialSection(),
              SizedBox(height: 24.h),
              AuthFooter(
                title: 'New here?',
                actionText: 'SignUp',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.createAccountScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
