import 'package:flutter/material.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/profile/presentation/widgets/back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomAppBarTow extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subTitle;
  final Widget? action;
  final Color titleColor;
  final Color subTitleColor;
  final Color appbarColor;
  final Color? iconColor;
  final VoidCallback? onPressed;

  const MyCustomAppBarTow({
    super.key,
    required this.title,
    this.action,
    required this.appbarColor,
    this.iconColor,
    this.onPressed,
    required this.subTitle,
    required this.titleColor,
    required this.subTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 12.w,
      title: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.h1.copyWith(color: titleColor)),
            Text(
              subTitle,
              style: AppTextStyles.caption.copyWith(color: subTitleColor),
            ),
          ],
        ),
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
