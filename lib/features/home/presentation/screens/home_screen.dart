import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/search/cubit/search_cubit.dart';
import 'package:ka3da/features/home/presentation/widgets/home/actions_buttons.dart';
import 'package:ka3da/features/home/presentation/widgets/home/categories_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/home/greating_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/home/restaurant_card.dart';
import 'package:ka3da/features/home/presentation/widgets/home/search_bar.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listenWhen: (previous, current) {
        return previous.allRestaurants != current.allRestaurants;
      },
      listener: (context, state) {
        context.read<SearchCubit<RestaurantEntity>>().setItems(
          state.allRestaurants,
        );
      },
      child: Scaffold(
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
                  _FeaturesTitle(title: 'Featured', ontap: () {}),
                  Gap(15),
                  SizedBox(
                    height: 314.h,
                    child: BlocBuilder<LocationCubit, LocationState>(
                      builder: (context, state) {
                        if (state.allRestaurants.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.allRestaurants.length > 5
                              ? 5
                              : state.allRestaurants.length,
                          itemBuilder: (context, index) {
                            final restaurant = state.allRestaurants[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.restaurantDetailsScreen,
                                  arguments: restaurant,
                                );
                              },
                              child: RestaurantCardHome(restaurant: restaurant),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: Gap(20)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _FeaturesTitle(title: 'Nearby', ontap: () {}),
                  Gap(16.h),
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      if (state.restaurants.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text("Go to Nearby page"),
                          ),
                        );
                      }
              
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.restaurants.length > 3
                              ? 3
                              : state.restaurants.length,
                          separatorBuilder: (_, __) => Gap(16.h),
                          itemBuilder: (context, index) {
                            final restaurant = state.restaurants[index];
              
                            return RestaurantCard(
                              restaurant: restaurant,
                              onReserve: () {},
                              onFavorite: () {},
                              onDirections: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.mapScreen,
                                  arguments: restaurant,
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.nearby);
                  },
                  child: Text(
                    'See All',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.primaryDot,
                    ),
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
