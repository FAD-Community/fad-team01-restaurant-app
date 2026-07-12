import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/home/presentation/widgets/actions_buttons.dart';
import 'package:ka3da/features/home/presentation/widgets/categories_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/greating_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.white,
            toolbarHeight: 225,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [GreetingAppbar(), ActionsButtons()],
                ),
                Gap(14),
                SearchBarWidgets(),
                Gap(14),
                CategoriesWidget(),
                Gap(5),
              ],
            ),
          ),
          SliverToBoxAdapter(child: Gap(20)),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: AppTextStyles.h1.copyWith(
                          color: AppColors.darkBackground,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: .center,
                        children: [
                          Text(
                            'See All',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.primaryDot,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryDot,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(15),
                SizedBox(
                  height: 305.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        width: 320.w,
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(22.r),
                                  ),
                                  child: Image.asset(
                                    'assets/main_flow/example.png',
                                    width: double.maxFinite,
                                    height: 200.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Positioned(
                                  top: 12.h,
                                  left: 12.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xffB9622C),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Text(
                                      '+ Free Welcome Drink',
                                      style: AppTextStyles.label.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 12.h,
                                  right: 12.w,
                                  child: Container(
                                    padding: EdgeInsets.all(8.r),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite_outline_rounded,
                                      color: Colors.grey[500],
                                      size: 26.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Gap(4),
                                  Text(
                                    'The Grill House',
                                    style: AppTextStyles.h2.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Steakhouse',
                                        style: AppTextStyles.captionMedium
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                      Gap(5),
                                      Text('.'),
                                      Gap(5),
                                      Text(
                                        'EGP 350–600 pp',
                                        style: AppTextStyles.captionMedium
                                            .copyWith(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Gap(5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.share_location_rounded,
                                        color: Colors.grey[400],
                                      ),
                                      Gap(4),
                                      Text(
                                        'New Cairo',
                                        style: AppTextStyles.inline.copyWith(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Gap(12),
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.grey[400],
                                      ),
                                      Gap(4),
                                      Text(
                                        '30 min',
                                        style: AppTextStyles.inline.copyWith(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: Gap(20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Nearby',
                        style: AppTextStyles.h1.copyWith(
                          color: AppColors.darkBackground,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: .center,
                        children: [
                          Text(
                            'See All',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.primaryDot,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryDot,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Gap(40),
                  Text('Code//'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
