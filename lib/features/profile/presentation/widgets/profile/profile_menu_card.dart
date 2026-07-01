import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_menu_item.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: menuItems(context).map((item) {
          return ProfileMenuItem(
            icon: item.icon,
            title: item.title,
            onTap: item.onTap,
            showDivider: item.showDivider ?? true,
          );
        }).toList(),
      ),
    );
  }
}
