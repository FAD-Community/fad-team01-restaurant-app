import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/features/profile/presentation/widgets/edit_profile/custom_text_field.dart';
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF3E6),
      appBar: MyCustomAppBar(
        title: "Change Password",
        textColor: const Color.fromARGB(255, 0, 0, 0),
        appbarColor: Color(0xffFFFEFC),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(24.h),
              Text(
                "Secure Your Account",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              Gap(8.h),

              Text(
                "Your new password must be different from your previous password.",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              Gap(32.h),

              CustomTextField(
                controller: currentPasswordController,
                label: "Current Password",
                hintText: "Enter your current password",
                icon: "assets/profile/settings/LockSimple.svg",
                isPassword: true,
              ),
              Gap(16.h),

              CustomTextField(
                controller: newPasswordController,
                label: "New Password",
                hintText: "Enter your new password",
                icon: "assets/profile/settings/LockSimple.svg",
                isPassword: true,
              ),

              Gap(16.h),

              CustomTextField(
                controller: confirmPasswordController,
                label: "Confirm Password",
                hintText: "Confirm your password",
                icon: "assets/profile/settings/LockSimple.svg",
                isPassword: true,
              ),

              Gap(44.h),

              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff8C1F22),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                width: double.infinity,
                height: 48.h,
                child: Text(
                  "Update Password",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
