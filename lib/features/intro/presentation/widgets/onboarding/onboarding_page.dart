import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/intro/presentation/widgets/onboarding/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.item});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(item.image, fit: BoxFit.cover),

        // Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [
        //         AppColors.transparent,
        //         Colors.black.withValues(alpha: .2),
        //         Colors.black.withValues(alpha: .7),
        //         AppColors.darkerBackground,
        //       ],
        //       stops: const [0, .4, .7, 1],
        //     ),
        //   ),
        // ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -160,
          child: Container(child: SvgPicture.asset("assets/splash/onboarding_bg.svg"))),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: AppTextStyles.hero.copyWith(
                    color: AppColors.white,
                    height: 1.1,
                  ),
                ),

                SizedBox(height: 16.h),

                Text(
                  item.description,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.white.withValues(alpha: .85),
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 130.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
