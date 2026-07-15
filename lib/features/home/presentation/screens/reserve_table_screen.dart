import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:ka3da/features/home/presentation/screens/review_reservation_screen.dart';

class ReserveTableScreen extends StatefulWidget {
  const ReserveTableScreen({super.key});

  @override
  State<ReserveTableScreen> createState() => _ReserveTableScreenState();
}

class _ReserveTableScreenState extends State<ReserveTableScreen> {
  DateTime _currentMonth = DateTime.now();
  DateTime? _selectedDate;
  String? _selectedTime;
  int _guestCount = 1;
  final TextEditingController _specialRequestsController = TextEditingController();

  final List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  void dispose() {
    _specialRequestsController.dispose();
    super.dispose();
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

  Widget _buildCalendarCard() {
    final totalDays = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final firstWeekday = firstDay.weekday; // 1: Mon, 7: Sun
    final offset = firstWeekday % 7; // Sunday is 0, Monday is 1, etc.
    
    final today = DateTime.now();
    final isCurrentMonth = _currentMonth.year == today.year && _currentMonth.month == today.month;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_rounded, color: AppColors.textDark),
                onPressed: isCurrentMonth 
                  ? null 
                  : () {
                      setState(() {
                        _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
                      });
                    },
              ),
              Text(
                '${_months[_currentMonth.month - 1]} ${_currentMonth.year}',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right_rounded, color: AppColors.textDark),
                onPressed: () {
                  setState(() {
                    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
                  });
                },
              ),
            ],
          ),
          Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map((day) {
              return SizedBox(
                width: 36.w,
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      fontFamily: AppTextStyles.bodyFont,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Gap(12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: offset + totalDays,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              if (index < offset) {
                return const SizedBox();
              }
              final day = index - offset + 1;
              final cellDate = DateTime(_currentMonth.year, _currentMonth.month, day);
              
              final isSelected = _selectedDate != null &&
                  _selectedDate!.year == cellDate.year &&
                  _selectedDate!.month == cellDate.month &&
                  _selectedDate!.day == cellDate.day;
              
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = cellDate;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.primary : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected
                            ? Colors.white
                            : AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlot(String time, {bool hasAvailableSubtext = false}) {
    final isSelected = _selectedTime == time;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTime = time;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: (MediaQuery.of(context).size.width - 32.w - 16.w) / 3,
        height: 56.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.textDark,
              ),
            ),
            if (hasAvailableSubtext) ...[
              Gap(2),
              Text(
                'Available',
                style: AppTextStyles.caption.copyWith(
                  fontSize: 10.sp,
                  color: isSelected ? Colors.white.withValues(alpha: 0.8) : AppColors.textMuted,
                ),
              ),
            ],
          ],
        ),
      ),
    );
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
                      Gap(16),
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
                  Gap(16),
                  Text(
                    'Step 1 of 3',
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
                  Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStepPill('Details', isActive: true),
                      _buildStepPill('Review', isActive: false),
                      _buildStepPill('Payment', isActive: false),
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
                      style: AppTextStyles.h2.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Gap(12),
                    _buildCalendarCard(),
                    
                    Gap(24),
                    Text(
                      'Select a Time',
                      style: AppTextStyles.h2.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Gap(8),
                    Text(
                      'LUNCH',
                      style: AppTextStyles.captionMedium.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(10),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: [
                        _buildTimeSlot('12:00 PM'),
                        _buildTimeSlot('12:30 PM'),
                        _buildTimeSlot('1:00 PM'),
                        _buildTimeSlot('1:30 PM'),
                        _buildTimeSlot('2:00 PM'),
                      ],
                    ),
                    
                    Gap(16),
                    Text(
                      'DINNER',
                      style: AppTextStyles.captionMedium.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(10),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: [
                        _buildTimeSlot('7:30 PM'),
                        _buildTimeSlot('8:00 PM'),
                        _buildTimeSlot('8:30 PM'),
                        _buildTimeSlot('9:00 PM'),
                        _buildTimeSlot('9:30 PM', hasAvailableSubtext: true),
                        _buildTimeSlot('10:00 PM', hasAvailableSubtext: true),
                        _buildTimeSlot('10:30 PM', hasAvailableSubtext: true),
                        _buildTimeSlot('11:00 PM', hasAvailableSubtext: true),
                      ],
                    ),
                    
                    Gap(24),
                    Text(
                      'Guest Number & Requests',
                      style: AppTextStyles.h2.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Gap(12),
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
                            'NUMBER OF GUESTS',
                            style: AppTextStyles.captionMedium.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Gap(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: _guestCount > 1
                                    ? () {
                                        setState(() {
                                          _guestCount--;
                                        });
                                      }
                                    : null,
                                child: Container(
                                  height: 44.w,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0xffE2D4C1)),
                                    color: Colors.transparent,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 20.sp,
                                    color: _guestCount > 1 ? AppColors.textDark : AppColors.textDark.withValues(alpha: 0.3),
                                  ),
                                ),
                              ),
                              Gap(24),
                              Column(
                                children: [
                                  Text(
                                    '$_guestCount',
                                    style: AppTextStyles.h1.copyWith(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  Text(
                                    'guests',
                                    style: AppTextStyles.caption.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(24),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _guestCount++;
                                  });
                                },
                                child: Container(
                                  height: 44.w,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0xffE2D4C1)),
                                    color: Colors.transparent,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 20.sp,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    Gap(16),
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
                            'SPECIAL REQUESTS (optional)',
                            style: AppTextStyles.captionMedium.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Gap(12),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFFF9F6),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            child: TextField(
                              controller: _specialRequestsController,
                              maxLines: 4,
                              style: AppTextStyles.body.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.textDark,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Allergies, dietary needs, celebrations, seating preferences',
                                hintStyle: AppTextStyles.body.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.textMuted.withValues(alpha: 0.6),
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Gap(24),
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
