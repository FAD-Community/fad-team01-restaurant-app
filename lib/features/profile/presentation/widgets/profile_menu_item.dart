import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/features/profile/presentation/screens/edit_profile_screen.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.showDivider = true,
  });

  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              bottom: 12.h,
              left: 16.w,
              right: 16.w,
            ),
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F2E7),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(child: icon),
                ),
                Gap(12.w),

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                Icon(Icons.chevron_right, size: 18.sp),
              ],
            ),
          ),
        ),

        if (showDivider)
          Divider(
            indent: 72.w,
            endIndent: 16.w,
            height: 1.h,
            color: const Color(0xffEFE7DA),
          ),
      ],
    );
  }
}

class ProfileMenuModel {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  final bool? showDivider;

  const ProfileMenuModel({
    required this.icon,
    required this.title,
    this.onTap,
    this.showDivider = true,
  });
}

List<ProfileMenuModel> menuItems(BuildContext context) {
  return [
    ProfileMenuModel(
      icon: SvgPicture.asset("assets/profile/list_profile/PencilSimple.svg"),
      title: "Edit Profile",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
        );
      },
    ),
    ProfileMenuModel(
      icon: SvgPicture.asset("assets/profile/list_profile/Gear.svg"),
      title: "Settings",
    ),
    ProfileMenuModel(
      icon: SvgPicture.asset("assets/profile/list_profile/Info.svg"),
      title: "About Qa3da",
    ),
    ProfileMenuModel(
      icon: SvgPicture.asset(
        "assets/profile/list_profile/solar_share-linear.svg",
      ),
      title: "Share App",
    ),
    ProfileMenuModel(
      icon: SvgPicture.asset("assets/profile/list_profile/Headset.svg"),
      title: "Help & Support",
      showDivider: false,
    ),
  ];
}
