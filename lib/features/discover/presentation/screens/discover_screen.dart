import 'package:flutter/material.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_app_bar_1.dart';
import 'package:ka3da/features/layout/presentation/widget/navigation_controller.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBarOne(
        onPressed: () {
          NavigationController.controller.jumpToTab(0);
        },
        title: "Discover",
        textColor: AppColors.darkBackground,
        appbarColor: AppColors.surfaceWhite,
      ),
      body: Column(
        children: [
          Row(),
          Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.nearbyRestaurants);
                },
                child: Text("CUISINE"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
