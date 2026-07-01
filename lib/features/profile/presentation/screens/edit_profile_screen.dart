import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/features/profile/presentation/widgets/edit_profile/custom_text_field.dart';
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';
import 'package:ka3da/features/profile/presentation/widgets/edit_profile/preferences.dart';
import 'package:ka3da/features/profile/presentation/widgets/edit_profile/profile_bottom_sheet.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile_pic.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();
  File? selectedImage;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF3E6),
      appBar: MyCustomAppBar(
        action: Padding(
          padding: EdgeInsetsGeometry.only(right: 32.w, bottom: 20.h),
          child: Text("Save", style: TextStyle(fontSize: 16.sp)),
        ),
        title: "Edit Profile",
        textColor: const Color.fromARGB(255, 0, 0, 0),
        appbarColor: Color(0xffFFFEFC),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(24.h),

            Container(
              alignment: Alignment.center,
              child: ProfilePic(
                image: selectedImage,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => ProfilePictureBottomSheet(
                      onImageSelected: (image) {
                        setState(() {
                          selectedImage = image;
                        });
                      },
                    ),
                  );
                },
                width: 90.w,
                height: 90.h,
                showCameraIcon: true,
              ),
            ),
            Gap(32.h),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w),
              child: CustomTextField(
                controller: nameController,
                label: "Full Name",
                hintText: "Enter your name",
                icon: "assets/profile/edit_profile/User.svg",
              ),
            ),

            Gap(16.h),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w),
              child: CustomTextField(
                controller: emailController,
                label: "Email Address",
                hintText: "Enter your email",
                icon: "assets/profile/edit_profile/EnvelopeSimple.svg",
              ),
            ),

            Gap(16.h),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 16.w, right: 16.w),
              child: CustomTextField(
                controller: bioController,
                label: "Bio",
                hintText: "Tell us about your dining preferences....",
                maxLines: 3,
              ),
            ),
            Gap(16.h),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 18.w),
              child: Text(
                "Dietary Preferences",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff261C14),
                ),
              ),
            ),
            Gap(8.h),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 16.w),
              child: Preferences(),
            ),
          ],
        ),
      ),
    );
  }
}
