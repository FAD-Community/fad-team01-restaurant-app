import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ka3da/features/profile/presentation/widgets/profile_menu_item.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: ProfileMenuItem(
        icon:  SvgPicture.asset("assets/profile/list_profile/SignOut.svg"),
        title: "Log out",
        showDivider: false,
      ),
    );
  }
}
