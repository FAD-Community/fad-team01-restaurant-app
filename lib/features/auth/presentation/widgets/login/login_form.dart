import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label('Email Address'),

        field(
          hint: 'Enter your email',
          icon: "assets/create_account/EnvelopeSimple.svg",
          keyboardType: TextInputType.emailAddress,
        ),

        SizedBox(height: 16.h),

        label('Password'),

        field(
          hint: 'Enter your password',
          icon: "assets/create_account/LockSimple.svg",
          isPassword: true,
        ),

        SizedBox(height: 4.h),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.forgetPasswordScreen);
            },
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.caption.copyWith(color: AppColors.accent),
            ),
          ),
        ),

        SizedBox(height: 20.h),

        CustomButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
          },
          child: Text(
            'Sign in',
            style: AppTextStyles.bodySemiBold.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }

  Widget label(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text(text, style: AppTextStyles.body),
      ),
    );
  }

  Widget field({
    required String hint,
    required String icon,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: isPassword ? obscurePassword : false,
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
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  icon: Icon(
                    obscurePassword
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
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
