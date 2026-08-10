import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';

class ProductImageAndActions extends StatefulWidget {
  const ProductImageAndActions({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  State<ProductImageAndActions> createState() => _ProductImageAndActionsState();
}

class _ProductImageAndActionsState extends State<ProductImageAndActions> {
  // final RestaurantEntity restaurant;

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  late final List<String> images;
  @override
  void initState() {
    super.initState();

    images = [widget.restaurant.image];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceWhite,
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 320.h,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.network(images[index], fit: BoxFit.cover),
                    );
                  },
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
              Positioned(
                top: 12.h,
                left: 12.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: 26.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5.h,
                bottom: 5,
                right: 12.w,
                child: GestureDetector(
                  onTap: () {
                    if (_pageController.hasClients) {
                      final nextIndex = (_currentIndex + 1) % images.length;
                      _pageController.animateToPage(
                        nextIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 28.sp,
                  ),
                ),
              ),
              Positioned(
                bottom: 18,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceWhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: const Color.fromARGB(255, 241, 194, 38),
                        size: 28.sp,
                      ),
                      Gap(5),

                      Text(
                        widget.restaurant.rating.toString(),
                        style: AppTextStyles.hint.copyWith(
                          color: AppColors.textDarkBrown,
                        ),
                      ),
                      Gap(5),
                      Text(
                        '(111 reviews)',
                        style: AppTextStyles.hint.copyWith(
                          color: AppColors.textDarkBrown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 18,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textDark,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: AppColors.progressInactive,
                        size: 28.sp,
                      ),
                      Gap(5),

                      Text(
                        '${images.length} Photos',
                        style: AppTextStyles.hint.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Gap(4),
          DotsIndicator(
            position: _currentIndex.toDouble(),
            dotsCount: images.length,
            animate: true,
            animationDuration: const Duration(milliseconds: 500),
            decorator: DotsDecorator(activeColor: AppColors.primaryDot),
          ),
        ],
      ),
    );
  }
}
