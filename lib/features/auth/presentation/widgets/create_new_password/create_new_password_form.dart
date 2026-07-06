import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:ka3da/features/auth/presentation/widgets/create_new_password/password_updated_bottom_sheet.dart';

class CreateNewPasswordForm extends StatelessWidget {
  const CreateNewPasswordForm({
    super.key,
    required this.obscureNew,
    required this.obscureConfirm,
    required this.onToggleNew,
    required this.onToggleConfirm,
  });

  final bool obscureNew;
  final bool obscureConfirm;

  final VoidCallback onToggleNew;
  final VoidCallback onToggleConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLabel('New Password'),
        _buildTextField(
          hint: 'Enter your password',
          icon: Icons.lock_outline,
          obscureText: obscureNew,
          onToggle: onToggleNew,
        ),

        SizedBox(height: 18.h),

        _buildLabel('Confirm Password'),
        _buildTextField(
          hint: 'Confirm your password',
          icon: Icons.lock_outline,
          obscureText: obscureConfirm,
          onToggle: onToggleConfirm,
        ),

        SizedBox(height: 40.h),

        CustomButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            showPasswordUpdatedBottomSheet(context);
          },
          child: Text(
            'Reset Password',
            style: AppTextStyles.bodySemiBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: AppTextStyles.body,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextField(
        obscureText: obscureText,
        style: AppTextStyles.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.textHint,
          ),
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.textHint,
            ),
          ),
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