import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/features/profile/presentation/widgets/logout_card.dart';
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile_menu_card.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile_pic.dart';
import 'package:ka3da/features/profile/presentation/widgets/badge.dart';
import 'package:ka3da/features/profile/presentation/widgets/statistic_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF3E6),
      appBar: MyCustomAppBar(
        title: "Profile",
        textColor: Colors.white,
        appbarColor: Color(0xff1A130D),
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
                  ProfilePic(width: 60.w, height: 60.h, showCameraIcon: false,),
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
                    color: Color(0xffFFD54C).withOpacity(0.2),
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
              padding: EdgeInsetsGeometry.only(top: 24.h ,bottom: 8.h, left: 16.w , right: 16.w),
              child: const ProfileMenuCard(),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 24.h , left: 16.w , right: 16.w),
              child: const LogoutCard(),
            ),
          ],
        ),
      ),
    );
  }
}
