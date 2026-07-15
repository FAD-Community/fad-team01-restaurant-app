import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/home/presentation/widgets/home/actions_buttons.dart';
import 'package:ka3da/features/home/presentation/widgets/home/categories_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/home/greating_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/home/restaurant_card.dart';
import 'package:ka3da/features/home/presentation/widgets/home/search_bar.dart';

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
                _FeaturesTitle(ontap: () {}, title: 'Featured'),
                Gap(15),
                SizedBox(
                  height: 314.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(0),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.restaurantDetailsScreen,
                          );
                        },
                        child: RestaurantCard(),
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
                  _FeaturesTitle(title: 'Nearby', ontap: () {}),
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

class _FeaturesTitle extends StatelessWidget {
  const _FeaturesTitle({super.key, required this.title, required this.ontap});

  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.h1.copyWith(color: AppColors.darkBackground),
          ),

          GestureDetector(
            onTap: ontap,
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
