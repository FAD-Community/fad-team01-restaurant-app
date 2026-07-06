import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBottomSection extends StatelessWidget {
  const OnboardingBottomSection({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.pageCount,
  });

  final PageController pageController;
  final int currentIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 16.h,
        ),
        child: Column(
          children: [
            currentIndex == pageCount - 1
                ? const SizedBox()
                : Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.authGateScreen,
                        );
                      },
                      child: Text(
                        'Skip',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),

            const Spacer(),

            Align(
              alignment: Alignment.centerLeft,
              child: SmoothPageIndicator(
                controller: pageController,
                count: pageCount,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryDot,
                  dotColor: Colors.grey.shade600,
                  dotHeight: 6.h,
                  dotWidth: 8.w,
                  expansionFactor: 3,
                  spacing: 6.w,
                ),
              ),
            ),

            SizedBox(height: 32.h),

            CustomButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                if (currentIndex < pageCount - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.authGateScreen,
                  );
                }
              },
              child: Text(
                currentIndex == pageCount - 1
                    ? 'Get Started'
                    : 'Continue',
                style: AppTextStyles.bodySemiBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}