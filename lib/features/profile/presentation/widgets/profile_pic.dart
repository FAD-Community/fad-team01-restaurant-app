// ignore_for_file: sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    super.key,
    required this.width,
    required this.height,
    required this.showCameraIcon,
    this.onTap,
    this.image,
  });
  final double width;
  final double height;
  final VoidCallback? onTap;
  final File? image;

  final bool showCameraIcon;
  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.r)),
      child: Stack(
        children: [
          ClipOval(
            child: widget.image != null
                ? Image.file(
                    widget.image!,
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/profile/profile_image.png",
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                  ),
                  
          ),
          if (widget.showCameraIcon)
            Positioned(
              bottom: 4.h,
              right: 2.w,
              child: GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Colors.black,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 12.w,
                    height: 12.h,
                    child: SvgPicture.asset(
                      "assets/profile/edit_profile/solar_camera-broken.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
