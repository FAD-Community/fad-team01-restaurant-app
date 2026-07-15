import 'package:flutter/material.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/profile/presentation/widgets/back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomAppBarOne extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  final Widget? action;
  final Color textColor;
  final Color appbarColor;
  final Color? iconColor;
  final VoidCallback? onPressed;

  const MyCustomAppBarOne({
    super.key,
    required this.title,
    this.action,
    required this.textColor,
    required this.appbarColor,
    this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 12.w,
      title: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 20.h),
        child: Text(title, style: AppTextStyles.h1 ),
      ),
      backgroundColor: appbarColor, // لون الخلفية
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w, bottom: 20.h),
        child: Back(onPressed: onPressed),
      ),
      actions: [?action],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
