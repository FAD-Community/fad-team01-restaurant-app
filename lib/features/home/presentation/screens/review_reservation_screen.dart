import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:ka3da/features/home/presentation/widgets/deposit_payment/alert_note.dart';
import 'package:ka3da/features/home/presentation/widgets/reserve_table/step_pill.dart';
import 'package:ka3da/features/home/presentation/widgets/review_reservation/reservation_details_card.dart';
import 'package:ka3da/features/home/presentation/widgets/review_reservation/restaurant_preview_card.dart';

class ReviewReservationArgs {
  final DateTime? date;
  final String? time;
  final int? guestCount;
  final String? specialRequests;

  ReviewReservationArgs({
    this.date,
    this.time,
    this.guestCount,
    this.specialRequests,
  });
}

class ReviewReservationScreen extends StatefulWidget {
  const ReviewReservationScreen({super.key});

  @override
  State<ReviewReservationScreen> createState() => _ReviewReservationScreenState();
}

class _ReviewReservationScreenState extends State<ReviewReservationScreen> {
  final List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  String _formatDate(DateTime date) {
    return '${_months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ReviewReservationArgs?;
    
    // Set fallback/default mock values if navigated directly
    final displayDate = args?.date ?? DateTime(2026, 6, 25);
    final displayTime = args?.time ?? '9:30 PM';
    final displayGuests = args?.guestCount ?? 5;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Sticky App Bar and Stepper
            Container(
              color: AppColors.scaffoldBackground,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: const BoxDecoration(
                            color: Color(0xffF2ECE4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16.sp,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      Gap(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Review Reservation',
                            style: AppTextStyles.h2.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'The Grill House',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xffA89785),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Text(
                    'Step 2 of 3',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff8C7461),
                    ),
                  ),
                  Gap(8.h),
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.progressInactive,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  Gap(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      StepPill(title: 'Details', isActive: true),
                      StepPill(title: 'Review', isActive: true),
                      StepPill(title: 'Payment', isActive: false),
                    ],
                  ),
                ],
              ),
            ),
            
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Restaurant Card
                    const RestaurantPreviewCard(),
                    
                    Gap(20.h),
                    
                    // Reservation Details Card
                    ReservationDetailsCard(
                      date: _formatDate(displayDate),
                      time: displayTime,
                      guests: '$displayGuests guests',
                    ),
                    
                    Gap(12.h),
                    
                    // Refundable Deposit Alert Row
                    const AlertNote(
                      text:
                          'A refundable deposit is required to confirm this booking',
                    ),
                    
                    Gap(24.h),
                    
                    // Payment Buttons
                    CustomButton(
                      backgroundColor: AppColors.primary,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.depositPaymentScreen,
                        );
                      },
                      child: Text(
                        'Continue to payment',
                        style: AppTextStyles.button.copyWith(color: Colors.white),
                      ),
                    ),
                    
                    Gap(12.h),
                    
                    CustomButton(
                      backgroundColor: const Color(0xffFAF3E6),
                      border: const BorderSide(color: Color(0xff261C14), width: 1),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.button.copyWith(
                          color: const Color(0xff261C14),
                        ),
                      ),
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

