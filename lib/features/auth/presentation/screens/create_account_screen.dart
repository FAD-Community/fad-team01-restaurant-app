import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_button.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_footer.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_social_section.dart';
import 'package:ka3da/features/auth/presentation/widgets/create_account/create_account_form.dart';
import 'package:ka3da/features/auth/presentation/widgets/create_account/create_account_header.dart';
import 'package:ka3da/features/auth/presentation/widgets/create_new_password/create_new_password_progress.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CreateAccountHeader(),

              SizedBox(height: 28.h),

              CreateAccountForm(
                firstNameController: _firstnameController,
                lastNameController: _lastnameController,
                emailController: _emailController,
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
                obscurePassword: obscurePassword,
                obscureConfirmPassword: obscureConfirmPassword,
                onPasswordToggle: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                onConfirmPasswordToggle: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
              ),
              Gap(28.h),

              AuthButton(
                text: "Signup",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.mainLayout);
                },
              ),
              SizedBox(height: 28.h),

              const AuthSocialSection(),

              SizedBox(height: 24.h),
              AuthFooter(
                title: 'Already have an account?',
                actionText: 'Signin',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.loginscreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
