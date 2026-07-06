import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';
import 'package:ka3da/features/profile/presentation/widgets/settings/privacy_expansion_tile.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF3E6),
      appBar: MyCustomAppBar(
        title: "Settings",
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
                "At Qa3da, we highly value your privacy and are committed to protecting your personal data.",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              Gap(8.h),

              Text(
                "This policy explains how we collect and use your info.",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300),
              ),
              Gap(24.h),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      PrivacyExpansionTile(
                        title: "1. Information We Collect",
                        content:
                            "We collect your name, email address, reservation history and dining preferences.",
                      ),

                      PrivacyExpansionTile(
                        title: "2. How We Use Your Information",
                        content:
                            "We use your information to improve your experience and manage reservations.",
                      ),

                      PrivacyExpansionTile(
                        title: "3. Data Security",
                        showDivider: false,
                        content:
                            "We use industry-standard security measures to protect your personal information.",
                      ),
                    ],
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
