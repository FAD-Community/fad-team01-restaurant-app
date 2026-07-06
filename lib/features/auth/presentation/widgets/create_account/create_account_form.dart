import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_button.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    super.key,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.onPasswordToggle,
    required this.onConfirmPasswordToggle,
    required TextEditingController firstnameController,
    required TextEditingController lastnameController,
    required TextEditingController emailController,
    required TextEditingController confirmPasswordController,
    required TextEditingController passwordController,
  });

  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final VoidCallback onPasswordToggle;
  final VoidCallback onConfirmPasswordToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldLabel(title: 'First Name'),
        const InputField(
          hint: 'Enter your first name',
          icon: "assets/create_account/User.svg",
        ),
        SizedBox(height: 16.h),
        FieldLabel(title: 'Last Name'),
        const InputField(
          hint: 'Enter your last name',
          icon: "assets/create_account/User.svg",
        ),
        SizedBox(height: 16.h),

        FieldLabel(title: 'Email Address'),
        const InputField(
          hint: 'Enter your email',
          icon: "assets/create_account/EnvelopeSimple.svg",
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),

        FieldLabel(title: 'Password'),
        InputField(
          hint: 'Enter your password',
          icon: "assets/create_account/LockSimple.svg",
          isPassword: true,
          obscureText: obscurePassword,
          onToggleVisibility: onPasswordToggle,
        ),
        SizedBox(height: 16.h),

        FieldLabel(title: 'Confirm Password'),
        InputField(
          hint: 'Confirm your password',
          icon: "assets/create_account/LockSimple.svg",
          isPassword: true,
          obscureText: obscureConfirmPassword,
          onToggleVisibility: onConfirmPasswordToggle,
        ),
        Gap(28.h),
        AuthButton(
          text: 'Signup',
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
          },
        ),
      ],
    );
  }
}

class FieldLabel extends StatelessWidget {
  const FieldLabel({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: AppTextStyles.body),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
  });

  final String hint;
  final String icon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: AppTextStyles.caption,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.body.copyWith(
            color: AppColors.textHint,
            fontSize: 13,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(icon),
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onToggleVisibility,
                  icon: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textHint,
                    size: 18.sp,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.surfaceWhite,
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        ),
      ),
    );
  }
}
