import 'package:flutter/material.dart';
import 'package:ka3da/features/intro/presentation/widgets/onboarding/onboarding_bottom_section.dart';
import 'package:ka3da/features/intro/presentation/widgets/onboarding/onboarding_model.dart';
import 'package:ka3da/features/intro/presentation/widgets/onboarding/onboarding_page.dart';
import 'package:ka3da/core/theme/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) =>
                OnboardingPage(item: onboardingPages[index]),
          ),

          OnboardingBottomSection(
            pageController: pageController,
            currentIndex: currentIndex,
            pageCount: onboardingPages.length,
          ),
        ],
      ),
    );
  }
}