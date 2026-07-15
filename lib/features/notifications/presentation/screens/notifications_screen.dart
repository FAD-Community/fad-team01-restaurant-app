import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/notifications/data/models/notification_item.dart';
import 'package:ka3da/features/notifications/presentation/widgets/notification_card.dart';
import 'package:ka3da/features/notifications/presentation/widgets/notifications_header.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationItem> newNotifications = [
    NotificationItem(
      title: 'Reservation Confirmed',
      body:
          'Your table at The Grill House on June 25 at 9:30 PM is confirmed.',
      time: '5 minutes ago',
      isUnread: true,
    ),
    NotificationItem(
      title: 'Weekend Special: Trattoria\nCentrale',
      body:
          'Get a free bottle of Prosecco on your next dinner reservation for 2 or more this weekend.',
      time: '22 hours ago',
      isUnread: true,
    ),
    NotificationItem(
      title: 'New Menu Launch at Ocean View',
      body:
          'Join us for the unveiling of our new summer menu featuring fresh seafood and seasonal ingredients.',
      time: '3 days ago',
      isUnread: true,
    ),
  ];

  final List<NotificationItem> earlierNotifications = [
    NotificationItem(
      title: 'Reminder: Dinner on Friday',
      body:
          'Your reservation at La Maison Dorée is in 3 days — Friday, June 30 at 8:00 PM for 4 guests.',
      time: '1 week ago',
      isUnread: false,
    ),
    NotificationItem(
      title: 'How was Trattoria Centrale?',
      body:
          'You dined with us on May 18. We\'d love to hear about your experience — leave a review.',
      time: '3 weeks ago',
      isUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Header Extracted Widget
            NotificationsHeader(
              unreadCount: 3,
              onMarkAllRead: () {
                // TODO: Implement Mark all as read logic
              },
            ),

            // List of notifications
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NEW section
                    Text(
                      'NEW',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xff8C7461),
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(12.h),
                    ...newNotifications.map(
                      (item) => NotificationCard(item: item),
                    ),

                    Gap(16.h),

                    // EARLIER section
                    Text(
                      'EARLIER',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xff8C7461),
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(12.h),
                    ...earlierNotifications.map(
                      (item) => NotificationCard(item: item),
                    ),
                    Gap(24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}