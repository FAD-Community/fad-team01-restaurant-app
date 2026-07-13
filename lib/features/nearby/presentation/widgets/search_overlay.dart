import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';

class SearchOverlay extends StatelessWidget {
  const SearchOverlay({
    super.key,
    required this.layerLink,
    required this.controller,
    required this.overlayController,
  });

  final LayerLink layerLink;
  final TextEditingController controller;
  final OverlayPortalController overlayController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        targetAnchor: Alignment.bottomLeft,
        followerAnchor: Alignment.topLeft,
        offset: const Offset(0, 8),
        child: Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                final cubit = context.read<LocationCubit>();

                final data = controller.text.isEmpty
                    ? state.recentSearches
                    : cubit.getSuggestions(controller.text);

                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450.h),
                  child: Container(
                    width: double.maxFinite,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: const Color(0xffF5E8DF),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.14),
                          blurRadius: 35,
                          spreadRadius: 3,
                          offset: const Offset(0, 18),
                        ),
                      ],
                    ),
                    child: data.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 21,
                                  backgroundColor: AppColors.primary
                                      .withOpacity(.08),
                                  child: Icon(
                                    Icons.search_off_rounded,
                                    color: AppColors.primary,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  controller.text.isEmpty
                                      ? "No Recent Searches"
                                      : "No Restaurants Found",
                                  style: AppTextStyles.captionMedium,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (controller.text.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    18,
                                    16,
                                    18,
                                    12,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.history_rounded,
                                        color: AppColors.primary,
                                        size: 16.sp,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Recent Searches",
                                        style: AppTextStyles.captionlarge,
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: cubit.clearRecentSearches,
                                        child: Text(
                                          "Clear All",
                                          style: AppTextStyles.captionMedium
                                              .copyWith(
                                                color: AppColors.primary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              Flexible(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: data.length,
                                  separatorBuilder: (_, __) => Divider(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  itemBuilder: (context, index) {
                                    final restaurant = data[index];

                                    return InkWell(
                                      onTap: () {
                                        controller.text = restaurant.name;

                                        cubit.addRecent(restaurant);
                                        cubit.searchRestaurants(
                                          restaurant.name,
                                        );

                                        overlayController.hide();
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl: restaurant.image,
                                                width: 32,
                                                height: 32,
                                                fit: BoxFit.cover,
                                                placeholder: (_, __) =>
                                                    Container(
                                                      width: 32,
                                                      height: 32,
                                                      color:
                                                          Colors.grey.shade100,
                                                    ),
                                                errorWidget: (_, __, ___) =>
                                                    Container(
                                                      width: 32,
                                                      height: 32,
                                                      color:
                                                          Colors.grey.shade100,
                                                      child: const Icon(
                                                        Icons.restaurant,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(width: 14),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    restaurant.name,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppTextStyles
                                                        .captionMedium
                                                        .copyWith(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    restaurant.category,
                                                    style: AppTextStyles.inline
                                                        .copyWith(
                                                          color: Colors
                                                              .grey
                                                              .shade600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            controller.text.isEmpty
                                                ? IconButton(
                                                    splashRadius: 1,
                                                    onPressed: () {
                                                      cubit.removeRecent(
                                                        restaurant,
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      size: 13,
                                                      color:
                                                          Colors.grey.shade500,
                                                    ),
                                                  )
                                                : Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primary
                                                          .withOpacity(.08),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.north_west_rounded,
                                                      color: AppColors.primary,
                                                      size: 12,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
