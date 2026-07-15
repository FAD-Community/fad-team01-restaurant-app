import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

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

  Widget _buildStepPill(String title, {required bool isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : const Color(0xffEEDEC9),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        title,
        style: AppTextStyles.captionlarge.copyWith(
          fontSize: 12.sp,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? Colors.white : const Color(0xff8C7461),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xffA89785),
            size: 22.sp,
          ),
          Gap(12),
          Text(
            label,
            style: AppTextStyles.body.copyWith(
              fontSize: 15.sp,
              color: const Color(0xffA89785),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
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
                      Gap(16),
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
                  Gap(16),
                  Text(
                    'Step 2 of 3',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff8C7461),
                    ),
                  ),
                  Gap(8),
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
                  Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStepPill('Details', isActive: true),
                      _buildStepPill('Review', isActive: true),
                      _buildStepPill('Payment', isActive: false),
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/main_flow/example.png',
                            height: 180.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The Grill House',
                                  style: AppTextStyles.h2.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                Gap(4),
                                Text(
                                  'Steakhouse . New Cairo',
                                  style: AppTextStyles.caption.copyWith(
                                    fontSize: 14.sp,
                                    color: const Color(0xffA89785),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Gap(20),
                    
                    // Reservation Details Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reservation Details',
                            style: AppTextStyles.h2.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                          Gap(8),
                          _buildDetailRow(
                            Icons.calendar_today_outlined, 
                            'Date', 
                            _formatDate(displayDate),
                          ),
                          Divider(color: Colors.grey[200], height: 1),
                          _buildDetailRow(
                            Icons.access_time_outlined, 
                            'Time', 
                            displayTime,
                          ),
                          Divider(color: Colors.grey[200], height: 1),
                          _buildDetailRow(
                            Icons.people_outline_rounded, 
                            'Party Size', 
                            '$displayGuests guests',
                          ),
                        ],
                      ),
                    ),
                    
                    Gap(12),
                    
                    // Refundable Deposit Alert Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: const Color(0xffA33E32),
                          size: 16.sp,
                        ),
                        Gap(6),
                        Expanded(
                          child: Text(
                            'A refundable deposit is required to confirm this booking',
                            style: TextStyle(
                              fontFamily: AppTextStyles.bodyFont,
                              fontSize: 12.sp,
                              color: const Color(0xffA33E32),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    Gap(24),
                    
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
                    
                    Gap(12),
                    
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
                    Gap(24),
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
