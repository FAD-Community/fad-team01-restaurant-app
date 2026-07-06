import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/custom_text_form_field.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.onPasswordToggle,
    required this.onConfirmPasswordToggle,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final bool obscurePassword;
  final bool obscureConfirmPassword;

  final VoidCallback onPasswordToggle;
  final VoidCallback onConfirmPasswordToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FieldLabel(title: 'First Name'),

        CustomTextFormField(
          controller: firstNameController,
          hint: 'Enter your first name',
          icon: '',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              "assets/create_account/User.svg",
            ),
          ),
        ),

        SizedBox(height: 16.h),

        const FieldLabel(title: 'Last Name'),

        CustomTextFormField(
          controller: lastNameController,
          hint: 'Enter your last name',
          icon: '',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              "assets/create_account/User.svg",
            ),
          ),
        ),

        SizedBox(height: 16.h),

        const FieldLabel(title: 'Email Address'),

        CustomTextFormField(
          controller: emailController,
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
          controller: passwordController,
          hint: 'Enter your password',
          icon: '',
          isPassword: true,
          obscureText: obscurePassword,
          onToggleVisibility: onPasswordToggle,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              "assets/create_account/LockSimple.svg",
            ),
          ),
        ),

        SizedBox(height: 16.h),

        const FieldLabel(title: 'Confirm Password'),

        CustomTextFormField(
          controller: confirmPasswordController,
          hint: 'Confirm your password',
          icon: '',
          isPassword: true,
          obscureText: obscureConfirmPassword,
          onToggleVisibility: onConfirmPasswordToggle,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              "assets/create_account/LockSimple.svg",
            ),
          ),
        ),


       
      ],
    );
  }
}