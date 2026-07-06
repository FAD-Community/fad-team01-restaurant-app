import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/profile/data/datasource/about/team_data.dart';
import 'package:ka3da/features/profile/presentation/widgets/about/about_stat_card.dart';
import 'package:ka3da/features/profile/presentation/widgets/about/our_team.dart';
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF3E6),
      appBar: MyCustomAppBar(
        title: "About Qa3da",
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
              Container(
                width: double.infinity,
                height: 212.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/profile/about_screen/restaurant.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff806347).withValues(alpha: 0.3),
                            Color(0xff1A130D).withValues(alpha: 0.5),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      left: 22.w,
                      bottom: 60.h,
                      child: Text(
                        "Qa3da",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 22.w,
                      bottom: 18.h,
                      child: Text(
                        "Connecting food lovers with extraordinary\n dining",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(12.h),
              Row(
                children: [
                  AboutStatCard(
                    icon: "assets/profile/about_screen/map.svg",
                    value: "+250",
                    title: "Restaurants",
                  ),

                  SizedBox(width: 8.w),

                  AboutStatCard(
                    icon: "assets/profile/about_screen/Users.svg",
                    value: "+1000",
                    title: "Diners",
                  ),

                  SizedBox(width: 8.w),

                  AboutStatCard(
                    icon: "assets/profile/about_screen/star.svg",
                    value: "4.8",
                    title: "App Rating",
                  ),
                ],
              ),
              Gap(24.h),
              Text(
                "Our Mission",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              Gap(12.h),

              Text(
                style: AppTextStyles.body.copyWith(
                  color: Color.fromARGB(80, 38, 28, 20)
                ),

                """Qa3da was built on a simple belief, every great meal deserves to be discovered. We connect food lovers with the city's finest restaurants — from intimate neighbourhod tables to celebrated Michelin destinations — making the journey from curiosity to reservation effortless.
              \nOur platform surfaces honest reviews, real-time availability, and deep restaurant knowledge so every reservation is the right one.""",
              ),
              Gap(24.h),
              Text(
                "Our Team",
                style: TextStyle(
                  fontFamily: "PlusJakartaSans",
                  fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              Gap(12.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: teamMembers.length,
                separatorBuilder: (_, _) => SizedBox(height: 16.h),
                itemBuilder: (_, index) {
                  final member = teamMembers[index];

                  return OurTeam(
                    name: member.name,
                    title: member.title,
                    image: member.image,
                  );
                },
              ),
              Gap(24.h),

              Container(
                alignment: Alignment.center,
                child: Text(
                  "Qa3da v3.2.1 · © 2026 TableHub Inc. · All rights reserved.",
                  style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                ),
              ),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
