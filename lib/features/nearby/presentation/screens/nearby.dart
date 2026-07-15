import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_app_bar_2.dart';
import 'package:ka3da/core/widgets/search/cubit/search_cubit.dart';
import 'package:ka3da/core/widgets/search/widgets/custom_search_field.dart';
import 'package:ka3da/core/widgets/search/widgets/search_overlay.dart';
import 'package:ka3da/features/nearby/data/data/cities.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/restaurant_card.dart';
import 'package:ka3da/features/nearby/presentation/widgets/current_location_button.dart';
import 'package:ka3da/features/nearby/presentation/widgets/location_dropdown.dart';

import '../../data/models/card_model.dart';

class Nearby extends StatefulWidget {
  const Nearby({super.key});

  @override
  State<Nearby> createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  final TextEditingController search = TextEditingController();
  final OverlayPortalController overlayController = OverlayPortalController();

  final LayerLink layerLink = LayerLink();

  final FocusNode searchFocus = FocusNode();
  @override
  void dispose() {
    search.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    searchFocus.addListener(() {
      if (searchFocus.hasFocus) {
        overlayController.show();
      } else {
        overlayController.hide();
      }
    });
  }

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
        appBar: MyCustomAppBarTow(
          onPressed: () {
            Navigator.pop(context);
          },
          title: "Nearby Restaurants",
          appbarColor: AppColors.surfaceWhite,
          subTitle: 'Restaurants near you',
          titleColor: AppColors.darkBackground,
          subTitleColor: AppColors.textHint,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.surfaceWhite),
              width: double.maxFinite,
              height: 140.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Gap(15.h),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 237.w,
                            height: 32.h,
                            child: BlocBuilder<LocationCubit, LocationState>(
                              builder: (context, state) {
                                return LocationDropdown(
                                  selectedLocation: state.selectedCity?.name,
                                  locations: egyptCities
                                      .map((e) => e.name)
                                      .toList(),
                                  pathIconSvg: "assets/nearby/location.svg",
                                  hintText: "Select location",
                                  onChanged: (value) {
                                    final city = egyptCities.firstWhere(
                                      (e) => e.name == value,
                                    );

                                    final locationCubit = context
                                        .read<LocationCubit>();
                                    final searchCubit = context
                                        .read<SearchCubit<RestaurantEntity>>();

                                    locationCubit.selectCity(city);

                                    searchCubit.filter(
                                      locationCubit.state.restaurants,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          const LocationButton(),
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Column(
                      children: [
                        OverlayPortal(
                          controller: overlayController,
                          overlayChildBuilder: (context) {
                            return SearchOverlay<RestaurantEntity>(
                              layerLink: layerLink,
                              controller: search,
                              overlayController: overlayController,

                              onItemTap: (restaurant) {
                                final searchCubit = context
                                    .read<SearchCubit<RestaurantEntity>>();

                                final locationCubit = context
                                    .read<LocationCubit>();

                                locationCubit.setRestaurants(
                                  searchCubit.state.results,
                                );
                              },

                              itemBuilder: (context, restaurant) {
                                return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      restaurant.image,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(restaurant.name),
                                  subtitle: Text(restaurant.category),
                                );
                              },
                            );
                          },
                          child: CompositedTransformTarget(
                            link: layerLink,
                            child: CustomSearchField(
                              onClear: () {
                                final searchCubit = context
                                    .read<SearchCubit<RestaurantEntity>>();
                                final locationCubit = context
                                    .read<LocationCubit>();

                                searchCubit.clear();

                                locationCubit.setRestaurants(
                                  searchCubit.state.results,
                                );
                              },
                              onSubmitted: (value) {
                                final searchCubit = context
                                    .read<SearchCubit<RestaurantEntity>>();

                                final locationCubit = context
                                    .read<LocationCubit>();

                                searchCubit.search(value);

                                searchCubit.addRecent(value);

                                locationCubit.setRestaurants(
                                  searchCubit.state.results,
                                );

                                overlayController.hide();

                                FocusScope.of(context).unfocus();
                              },
                              focusNode: searchFocus,
                              onChanged: (value) {
                                final searchCubit = context
                                    .read<SearchCubit<RestaurantEntity>>();
                                final locationCubit = context
                                    .read<LocationCubit>();

                                searchCubit.search(value);

                                locationCubit.setRestaurants(
                                  searchCubit.state.results,
                                );
                              },
                              controller: search,
                              hintText: "Search nearby restaurants ,...",
                              pathIconSvg: "assets/nearby/Search.svg",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(12.h),
                  ],
                ),
              ),
            ),
            Gap(24.h),
            Expanded(
              child: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if (state.restaurants.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text("Select a city"),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.restaurants.length,
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
                              AppRoutes.mapscreen,
                              arguments: restaurant,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
