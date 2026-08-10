import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_app_bar_1.dart';
import 'package:ka3da/core/widgets/search/cubit/search_cubit.dart';
import 'package:ka3da/core/widgets/search/widgets/custom_search_field.dart';
import 'package:ka3da/core/widgets/search/widgets/search_overlay.dart';
import 'package:ka3da/features/discover/presentation/widgets/custom_search.dart';
import 'package:ka3da/features/layout/presentation/widget/navigation_controller.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController search = TextEditingController();

  final FocusNode searchFocus = FocusNode();

  final LayerLink layerLink = LayerLink();

  final OverlayPortalController overlayController = OverlayPortalController();

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
        appBar: MyCustomAppBarOne(
          onPressed: () {
            NavigationController.controller.jumpToTab(0);
          },
          title: "Discover",
          textColor: AppColors.darkBackground,
          appbarColor: AppColors.surfaceWhite,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(color: AppColors.surfaceWhite),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: OverlayPortal(
                              controller: overlayController,
                              overlayChildBuilder: (_) {
                                return SearchOverlay<RestaurantEntity>(
                                  layerLink: layerLink,
                                  controller: search,
                                  overlayController: overlayController,
                                  onItemTap: (restaurant) {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.mapScreen,
                                      arguments: restaurant,
                                    );
                                  },
                                  itemBuilder: (context, restaurant) {
                                    return ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
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
                                  controller: search,
                                  focusNode: searchFocus,
                                  hintText: "Search restaurants...",
                                  pathIconSvg: "assets/nearby/Search.svg",
                                  onChanged: (value) {
                                    context
                                        .read<SearchCubit<RestaurantEntity>>()
                                        .search(value);
                                  },
                                  onSubmitted: (value) {
                                    final cubit = context
                                        .read<SearchCubit<RestaurantEntity>>();

                                    cubit.search(value);
                                    cubit.addRecent(value);

                                    overlayController.hide();
                                    FocusScope.of(context).unfocus();
                                  },
                                  onClear: () {
                                    context
                                        .read<SearchCubit<RestaurantEntity>>()
                                        .clear();
                                  },
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          SizedBox(
                            width: 52,
                            height: 48,
                            child: InkWell(
                              onTap: () {
                                 
                              },
                              child: const CustomSearch()),
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
            Column(children: [
                 
                ],
              ),
          ],
        ),
      ),
    );
  }
}
