import 'package:flutter/material.dart';
import 'package:ka3da/features/layout/presentation/widget/navigation_controller.dart';
import 'package:ka3da/features/profile/presentation/widgets/my_custom_app_Bar.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        onPressed: () {
          NavigationController.controller.jumpToTab(0);
        },
        title: "Saved Places",
        textColor: Colors.white,
        appbarColor: const Color(0xff1A130D),
      ),
      body: Column(
        children: [
          Row(),
          Column(children: [Text("CUISINE")]),
        ],
      ),
    );
  }
}
