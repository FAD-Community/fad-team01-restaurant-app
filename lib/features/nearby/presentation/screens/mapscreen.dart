import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_app_bar_2.dart';
import 'package:ka3da/features/nearby/data/data/cities.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';

import 'package:ka3da/features/nearby/presentation/widgets/card/card_model.dart';
import 'package:ka3da/features/nearby/presentation/widgets/current_location_button.dart';
import 'package:ka3da/features/nearby/presentation/widgets/dummy_restaurants.dart';
import 'package:ka3da/features/nearby/presentation/widgets/location_dialog.dart';
import 'package:ka3da/features/nearby/presentation/widgets/location_dropdown.dart';
import 'package:ka3da/features/nearby/services/map_service.dart';
import 'package:ka3da/features/nearby/presentation/widgets/map_bottom_sheet.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({super.key, required this.restaurant});
  final RestaurantEntity restaurant;

  @override
  State<Mapscreen> createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  final TextEditingController search = TextEditingController();
  late RestaurantEntity currentRestaurant;
  @override
  void initState() {
    super.initState();
    currentRestaurant = widget.restaurant;
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  final GlobalKey<MapSampleState> mapKey = GlobalKey<MapSampleState>();
  @override
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
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.surfaceWhite),
            width: double.maxFinite,
            height: 68.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15.h),
                  Row(
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

                                context.read<LocationCubit>().selectCity(city);
                              },
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      const LocationButton(),
                    ],
                  ),
                  Gap(12.h),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: BlocListener<LocationCubit, LocationState>(
                    listener: (context, state) {
                      if (state.selectedCity != null) {
                        if (state.restaurants.isNotEmpty) {
                          setState(() {
                            currentRestaurant = state.restaurants.first;
                          });
                        }
                      }
                    },
                    child: MapSample(
                      key: mapKey,
                      restaurant: currentRestaurant,
                    ),
                  ),
                ),

                BlocBuilder<LocationCubit, LocationState>(
                  builder: (context, state) {
                    return MapBottomSheet(
                      restaurants: state.restaurants,
                      onRestaurantSelected: (restaurant) {
                        context.read<LocationCubit>().moveRestaurantToTop(
                          restaurant,
                        );

                        setState(() {
                          currentRestaurant = restaurant;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
