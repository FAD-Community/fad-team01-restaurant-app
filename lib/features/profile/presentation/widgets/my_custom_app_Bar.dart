import 'package:flutter/material.dart';
import 'package:ka3da/features/profile/presentation/widgets/back.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;
  final Color textColor;
  final Color appbarColor;

  const MyCustomAppBar({
    super.key,
    required this.title,
    this.action,
    required this.textColor,
    required this.appbarColor,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return AppBar(
      titleSpacing: w * 0.03,
      title: Padding(
        padding: EdgeInsets.only(top:h * 0.004),
        child: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold ,fontSize: w*.075),
        ),
      ),
      backgroundColor: appbarColor, // لون الخلفية
      leading: Padding(
        padding: EdgeInsets.only(left: w * 0.04),
        child: Back(),
      ),
      actions: [?action],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
