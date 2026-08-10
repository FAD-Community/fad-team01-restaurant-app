import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/custom_text_form_field.dart';

class LoginAccountForm extends StatefulWidget {
  const LoginAccountForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onPasswordToggle,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool obscurePassword;

  final VoidCallback onPasswordToggle;

  @override
  State<LoginAccountForm> createState() => _LoginAccountFormState();
}

class _LoginAccountFormState extends State<LoginAccountForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(height: 16.h),

          const FieldLabel(title: 'Email Address'),

          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            hint: 'Enter your email',
            icon: '',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(
                "assets/create_account/EnvelopeSimple.svg",
              ),
            ),
          ),

          SizedBox(height: 16.h),

          const FieldLabel(title: 'Password'),

          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
            controller: widget.passwordController,
            hint: 'Enter your password',
            icon: '',
            isPassword: true,
            obscureText: widget.obscurePassword,
            onToggleVisibility: widget.onPasswordToggle,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset("assets/create_account/LockSimple.svg"),
            ),
          ),
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
        ],
      ),
    );
  }
}
