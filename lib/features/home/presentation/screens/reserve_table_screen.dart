import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:ka3da/features/home/presentation/screens/review_reservation_screen.dart';
import 'package:ka3da/features/home/presentation/widgets/reserve_table/calendar_card.dart';
import 'package:ka3da/features/home/presentation/widgets/reserve_table/guest_counter.dart';
import 'package:ka3da/features/home/presentation/widgets/reserve_table/special_requests_field.dart';
import 'package:ka3da/features/home/presentation/widgets/reserve_table/step_pill.dart';
import 'package:ka3da/features/home/presentation/widgets/reserve_table/time_slot.dart';

class ReserveTableScreen extends StatefulWidget {
  const ReserveTableScreen({super.key});

  @override
  State<ReserveTableScreen> createState() => _ReserveTableScreenState();
}

class _ReserveTableScreenState extends State<ReserveTableScreen> {
  DateTime? _selectedDate;
  String? _selectedTime;
  int _guestCount = 1;
  final TextEditingController _specialRequestsController = TextEditingController();

  @override
  void dispose() {
    _specialRequestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
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
                            'Reserve a Table',
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
                    'Step 1 of 3',
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
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
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
                      StepPill(title: 'Review', isActive: false),
                      StepPill(title: 'Payment', isActive: false),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select a Date',
                      style: AppTextStyles.h2.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Gap(12.h),
                    CalendarCard(
                      selectedDate: _selectedDate,
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                    Gap(24.h),
                    Text(
                      'Select a Time',
                      style: AppTextStyles.h2.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Gap(8.h),
                    Text(
                      'LUNCH',
                      style: AppTextStyles.captionMedium.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(10.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: [
                        '12:00 PM',
                        '12:30 PM',
                        '1:00 PM',
                        '1:30 PM',
                        '2:00 PM',
                      ].map((time) {
                        return TimeSlot(
                          time: time,
                          isSelected: _selectedTime == time,
                          onTap: () {
                            setState(() {
                              _selectedTime = time;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    Gap(16.h),
                    Text(
                      'DINNER',
                      style: AppTextStyles.captionMedium.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(10.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: [
                        '7:30 PM',
                        '8:00 PM',
                        '8:30 PM',
                        '9:00 PM',
                        '9:30 PM',
                        '10:00 PM',
                        '10:30 PM',
                        '11:00 PM',
                      ].map((time) {
                        return TimeSlot(
                          time: time,
                          isSelected: _selectedTime == time,
                          hasAvailableSubtext: [
                            '9:30 PM',
                            '10:00 PM',
                            '10:30 PM',
                            '11:00 PM'
                          ].contains(time),
                          onTap: () {
                            setState(() {
                              _selectedTime = time;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    Gap(24.h),
                    Text(
                      'Guest Number & Requests',
                      style: AppTextStyles.h2.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Gap(12.h),
                    GuestCounter(
                      guestCount: _guestCount,
                      onDecrement: _guestCount > 1
                          ? () {
                              setState(() {
                                _guestCount--;
                              });
                            }
                          : null,
                      onIncrement: () {
                        setState(() {
                          _guestCount++;
                        });
                      },
                    ),
                    Gap(16.h),
                    SpecialRequestsField(
                      controller: _specialRequestsController,
                    ),
                    Gap(24.h),
                    CustomButton(
                      backgroundColor: AppColors.primary,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.reviewReservationScreen,
                          arguments: ReviewReservationArgs(
                            date: _selectedDate,
                            time: _selectedTime,
                            guestCount: _guestCount,
                            specialRequests: _specialRequestsController.text,
                          ),
                        );
                      },
                      child: Text(
                        'Review Reservation',
                        style: AppTextStyles.button.copyWith(
                          color: Colors.white,
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
