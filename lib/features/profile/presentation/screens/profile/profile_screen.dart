import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/api/end_points.dart';
import 'package:ka3da/core/cache/cache_helper.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_app_bar_1.dart';
import 'package:ka3da/features/layout/presentation/widget/navigation_controller.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile/logout_card.dart';
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile/profile_menu_card.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile_pic.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile/badge.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile/statistic_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: MyCustomAppBarOne(
        onPressed: () {
          NavigationController.controller.jumpToTab(0);
        },
        title: "Profile",
        textColor: AppColors.surfaceLight,
        appbarColor: AppColors.darkBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 258.h,
              decoration: BoxDecoration(color: Color(0xff1A130D)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(24.h),
                  ProfilePic(width: 60.w, height: 60.h, showCameraIcon: false),
                  Gap(12.h),
                  Text(
                    "Hesham Adel",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight(400),
                      fontSize: 16.sp,
                    ),
                  ),
                  Gap(8.h),
                  Badge(
                    icon: Icon(Icons.star),
                    color: Color(0xffFFD54C).withValues(alpha: 0.2),
                    title: 'Member',
                    width: 60.w,
                    height: 20.h,
                  ),
                  Gap(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StatisticItem(
                        icon: Icons.calendar_today_outlined,
                        value: "5",
                        title: "Bookings",
                      ),
                      Gap(12.w),

                      StatisticItem(
                        icon: Icons.favorite_border,
                        value: "3",
                        title: "Saved",
                      ),
                      Gap(12.w),

                      StatisticItem(
                        icon: Icons.star_border,
                        value: "4.5",
                        title: "Avg. Rating",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: 24.h,
                bottom: 8.h,
                left: 16.w,
                right: 16.w,
              ),
              child: const ProfileMenuCard(),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: 24.h,
                left: 16.w,
                right: 16.w,
              ),
              child: InkWell(
                onTap: () async {
                  await CacheHelper.removeData(key: ApiKey.token);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.loginscreen,
                    (route) => false,
                  );
                },
                child: const LogoutCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
