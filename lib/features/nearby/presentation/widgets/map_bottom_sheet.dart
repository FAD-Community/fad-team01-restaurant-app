import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/restaurant_card.dart';

class MapBottomSheet extends StatelessWidget {
  const MapBottomSheet({
    super.key,
    required this.restaurants,
    required this.onRestaurantSelected,
  });

  final List<RestaurantEntity> restaurants;
  final Function(RestaurantEntity) onRestaurantSelected;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .28,
      minChildSize: .18,
      maxChildSize: .82,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: restaurants.isEmpty
                    ? const Center(child: Text("No restaurants found"))
                    : AnimationLimiter(
                        child: ListView.separated(
                          controller: scrollController,
                          padding: const EdgeInsets.all(16),
                          itemCount: restaurants.length,
                          separatorBuilder: (_, __) => SizedBox(height: 16.h),
                          itemBuilder: (context, index) {
                            final restaurant = restaurants[index];

                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 700),
                              child: SlideAnimation(
                                verticalOffset: 60,
                                curve: Curves.easeOutCubic,
                                child: FadeInAnimation(
                                  child: PageTransitionSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    transitionBuilder:
                                        (
                                          child,
                                          primaryAnimation,
                                          secondaryAnimation,
                                        ) {
                                          return SharedAxisTransition(
                                            animation: primaryAnimation,
                                            secondaryAnimation:
                                                secondaryAnimation,
                                            transitionType:
                                                SharedAxisTransitionType.scaled,
                                            child: child,
                                          );
                                        },
                                    child: RestaurantCard(
                                      key: ValueKey(restaurant.id),
                                      restaurant: restaurant,
                                      onDirections: () {
                                        onRestaurantSelected(restaurant);
                                      },
                                      onFavorite: () {},
                                      onReserve: () {},
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
