import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/features/booking/presentation/screens/past_bookings.dart';
import 'package:ka3da/features/booking/presentation/screens/upcoming_bookings.dart';
import 'package:ka3da/features/booking/presentation/widgets/booking_card.dart';
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
        title: "Booking",
        textColor: Colors.white,
        appbarColor: AppColors.surfaceWhite,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: "Upcoming"),
                Tab(text: "Past"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [UpcomingBookingsTab(), PastBookingsTab()],
              ),
            ),
            Gap(20.h),
           
          ],
        ),
      ),
    );
  }
}
