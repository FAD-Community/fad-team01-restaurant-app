import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';
import 'package:ka3da/features/profile/presentation/widgets/settings/delete_account_dialog.dart';
import 'package:ka3da/features/profile/presentation/widgets/settings/settings_language_tile.dart';
import 'package:ka3da/features/profile/presentation/widgets/settings/settings_navigation_tile.dart';

import 'package:ka3da/features/profile/presentation/widgets/settings/settings_section.dart';
import 'package:ka3da/features/profile/presentation/widgets/settings/settings_switch_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool sendNotifications = true;
  bool emailNotifications = false;
  bool reservationReminder = true;
  bool changeMode = false;
  bool locationServices = false;

  String currentLanguage = "English";
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
              SettingsSections(
                title: 'NOTIFICATIONS',
                svgPath: 'assets/profile/settings/BellSimple.svg',
              ),
              Gap(12.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SettingsSwitchTile(
                      title: "Send Notifications",
                      subtitle: "Receive alerts on this device",
                      value: sendNotifications,
                      onChanged: (value) {
                        setState(() {
                          sendNotifications = value;
                        });
                      },
                    ),

                    SettingsSwitchTile(
                      title: "Email Notifications",
                      value: emailNotifications,
                      onChanged: (value) {
                        setState(() {
                          emailNotifications = value;
                        });
                      },
                    ),

                    SettingsSwitchTile(
                      title: "Reservation Reminders",
                      subtitle: "2-hour reminder before dining",
                      value: reservationReminder,
                      showDivider: false,
                      onChanged: (value) {
                        setState(() {
                          reservationReminder = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Gap(24.h),
              SettingsSections(
                title: 'PREFERENCES',
                svgPath: 'assets/profile/settings/mynaui_wrench.svg',
              ),
              Gap(12.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SettingsSwitchTile(
                      title: "Change Mode",
                      subtitle: "Change between Dark/Light Mode",
                      value: changeMode,
                      onChanged: (value) {
                        setState(() {
                          changeMode = value;
                        });
                      },
                    ),
                    SettingsSwitchTile(
                      title: "Location Services",
                      subtitle: "For accurate nearby restaurant results",
                      value: locationServices,
                      onChanged: (value) {
                        setState(() {
                          locationServices = value;
                        });
                      },
                    ),
                    SettingsLanguageTile(
                      language: currentLanguage,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Gap(24.h),
              SettingsSections(
                title: 'PRIVACY & SECURITY',
                svgPath:
                    'assets/profile/settings/material-symbols-light_shield-outline-rounded.svg',
              ),
              Gap(8.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    SettingsNavigationTile(
                      title: "Change Password",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.changePassword);
                      },
                    ),

                    SettingsNavigationTile(
                      title: "Privacy Policy",
                      showDivider: false,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.privacyPolicyScreen,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Gap(24.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: SettingsNavigationTile(
                  title: "Delete account",
                  showDivider: false,
                  leading: SvgPicture.asset(
                    "assets/profile/settings/mynaui_trash.svg",
                    width: 15.w,
                    height: 18.h,
                  ),
                  onTap: () {
                    showDeleteAccountDialog(
                      context,
                      onDelete: () {
                        // API Delete Account
                      },
                    );
                  },
                ),
              ),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
