import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_button.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_footer.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_social_section.dart';
import 'package:ka3da/features/auth/presentation/widgets/login/login_form.dart';
import 'package:ka3da/features/auth/presentation/widgets/login/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
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

              LoginAccountForm(
                emailController: emailController,
                passwordController: passwordController,
                obscurePassword: obscurePassword,
                onPasswordToggle: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              SizedBox(height: 24.h),

              AuthButton(
                text: "Signin",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.mainLayout);
                },
              ),
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
