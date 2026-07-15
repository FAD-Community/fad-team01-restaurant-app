import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_app_bar_2.dart';
import 'package:ka3da/features/nearby/data/data/cities.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/restaurant_card.dart';
import 'package:ka3da/features/nearby/presentation/widgets/current_location_button.dart';
import 'package:ka3da/features/nearby/presentation/widgets/custom_search_field.dart';
import 'package:ka3da/features/nearby/presentation/widgets/location_dialog.dart';
import 'package:ka3da/features/nearby/presentation/widgets/location_dropdown.dart';
import 'package:ka3da/features/nearby/presentation/widgets/search_overlay.dart';
import 'package:ka3da/features/nearby/presentation/widgets/search_suggestions.dart';

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
      if (!searchFocus.hasFocus) {
        overlayController.hide();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                        Container(
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

                                  context.read<LocationCubit>().selectCity(
                                    city,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Spacer(),
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
                          return SearchOverlay(
                            layerLink: layerLink,
                            controller: search,
                            overlayController: overlayController,
                          );
                        },
                        child: CompositedTransformTarget(
                          link: layerLink,
                          child: CustomSearchField(
                            focusNode: searchFocus,
                            onChanged: (value) {
                              if (searchFocus.hasFocus) {
                                overlayController.show();
                              } else {
                                overlayController.hide();
                              }

                              setState(() {});
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
    );
  }
}
