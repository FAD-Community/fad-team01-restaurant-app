import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/home/presentation/widgets/restaurant_detail/info_cards.dart';
import 'package:ka3da/features/home/presentation/widgets/restaurant_detail/product_image_and_actions.dart';
import 'package:ka3da/features/home/presentation/widgets/restaurant_detail/restaurant_keywords.dart';
import 'package:ka3da/features/home/presentation/widgets/restaurant_detail/overview_tab.dart';
import 'package:ka3da/features/home/presentation/widgets/restaurant_detail/menu_tab.dart';
import 'package:ka3da/features/home/presentation/widgets/restaurant_detail/reviews_tab.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  int _activeTabIndex = 0;

  Widget _buildTabItem(int index, String title) {
    final isActive = _activeTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          border: isActive
              ? Border(
                  bottom: BorderSide(color: AppColors.primary, width: 2.h),
                )
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.primary : const Color(0xffD3A69C),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageAndActions(restaurant: restaurant),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.surfaceWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.textDarkBrown,
                        fontSize: 28.sp,
                      ),
                    ),
                    Gap(1),
                    Row(
                      children: [
                        Text(
                          restaurant.category,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textMuted,
                            fontSize: 16.sp,
                          ),
                        ),
                        Gap(5),
                        Text('.'),
                        Gap(5),
                        Text(
                          restaurant.price,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textMuted,
                            fontSize: 16.sp,
                          ),
                        ),
                        Gap(5),
                        Text('.'),
                        Gap(5),
                        Text(
                          'Tanta Qism 2',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textMuted,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      children: [
                        RestaurantKeywords(title: restaurant.category),
                      ],
                    ),

                    Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: InfoCard(
                            icon: Icons.star,
                            value: restaurant.rating.toString(),
                            label: 'Rating',
                          ),
                        ),

                        Gap(12),

                        Expanded(
                          child: InfoCard(
                            icon: Icons.access_time,
                            value: '${restaurant.time} min',
                            label: 'Time',
                          ),
                        ),

                        Gap(12),

                        Expanded(
                          child: InfoCard(
                            icon: Icons.restaurant,
                            value: restaurant.isOpen ? 'Open' : 'Closed',
                            label: 'Status',
                          ),
                        ),
                        Gap(12),
                        Expanded(
                          child: InfoCard(
                            icon: Icons.access_time,
                            value: '5:30 PM',
                            label: 'Opens at',
                          ),
                        ),
                        Gap(12),
                       
                      ],
                    ),
                  ],
                ),
              ),

              // Tabs Selector
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceWhite,
                  border: Border(
                    bottom: BorderSide(
                      color: const Color(0xffF2ECE4),
                      width: 1.h,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabItem(0, 'Overview'),
                    _buildTabItem(1, 'Menu'),
                    _buildTabItem(2, 'Reviews'),
                  ],
                ),
              ),

              // Tab contents
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                  child: _activeTabIndex == 0
                      ? OverviewTab(
                          key: const ValueKey('OverviewTab'),
                          restaurant: restaurant,
                        )
                      : _activeTabIndex == 1
                      ? const MenuTab(key: ValueKey('MenuTab'))
                      : const ReviewsTab(key: ValueKey('ReviewsTab')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
