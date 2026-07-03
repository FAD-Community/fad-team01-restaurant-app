import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/features/profile/presentation/widgets/about/about_stat_card.dart';
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
                            Color(0xff806347).withOpacity(0.3),
                            Color(0xff1A130D).withOpacity(0.5),
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
            ],
          ),
        ),
      ),
    );
  }
}
