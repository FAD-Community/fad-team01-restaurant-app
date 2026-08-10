import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_app_bar_2.dart';
import 'package:ka3da/features/layout/presentation/widget/navigation_controller.dart';
import 'package:ka3da/features/saved/presentation/widgets/card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBarTow(
        onPressed: () {
          NavigationController.controller.jumpToTab(0);
        },
        title: "Saved Places",
        appbarColor: AppColors.surfaceWhite,
        subTitle: '3 saved restaurants',
        titleColor: AppColors.darkBackground,
        subTitleColor: AppColors.textHint,
      ),
      body: Column(
        children: [
          Gap(24.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SavedCard(),
          ),
        ],
      ),
    );
  }
}
