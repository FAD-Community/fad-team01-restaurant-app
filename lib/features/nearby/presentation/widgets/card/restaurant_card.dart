import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/card_model.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/custom_button.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/image_card.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    this.onFavorite,
    this.onReserve,
    this.onDirections,
  });

  final RestaurantEntity restaurant;

  final VoidCallback? onFavorite;
  final VoidCallback? onReserve;
  final VoidCallback? onDirections;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        children: [
          ImageCard(image: restaurant.image, isOpen: restaurant.isOpen),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant.name,
                              style: AppTextStyles.bodyMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  softWrap: true,
                                  restaurant.category,
                                  style: AppTextStyles.inline,
                                ),
                                Text(
                                  "  .",
                                  style: AppTextStyles.caption.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Gap(5.w),
                                Text(
                                  restaurant.price,
                                  style: AppTextStyles.inline,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: InkWell(
                            onTap: onFavorite,
                            child: Icon(
                              restaurant.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 18,
                              color: const Color.fromARGB(255, 197, 197, 197),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(8.h),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.star_border, size: 12.sp),
                          Gap(3.w),
                          Text(
                            restaurant.rating.toString(),
                            style: AppTextStyles.caption,
                          ),
                          Gap(6.w),
                          Icon(Icons.access_time, size: 12.sp),
                          Gap(3.w),
                          Text(
                            "${restaurant.time} min",
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.darkerBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(8.h),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomButtonNer(
                            text: "Directions",
                            onPressed: onDirections ?? () {},
                            isOutlined: true,
                            borderColor: Colors.black,
                            textColor: AppColors.darkBackground,
                          ),
                        ),
                        Gap(8.w),
                        Expanded(
                          child: CustomButtonNer(
                            text: "Reserve",
                            onPressed: onReserve ?? () {},
                            textColor: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
