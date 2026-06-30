import 'package:flutter/material.dart';
import 'package:ka3da/features/profile/presentation/widgets/back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;
  final Color textColor;
  final Color appbarColor;
  final Color? iconColor;

  const MyCustomAppBar({
    super.key,
    required this.title,
    this.action,
    required this.textColor,
    required this.appbarColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return AppBar(
      titleSpacing: 12.w,
      title: Padding(
        padding: EdgeInsets.only(top: 0 ,bottom:20.h ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),
        ),
      ),
      backgroundColor: appbarColor, // لون الخلفية
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w,bottom:20.h ),
        child: Back(),
      ),
      actions: [?action],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
