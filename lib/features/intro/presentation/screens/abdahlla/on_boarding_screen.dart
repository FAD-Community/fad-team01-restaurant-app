// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ka3da/core/routing/app_routes.dart';
// import 'package:ka3da/core/theme/colors.dart';
// import 'package:ka3da/core/theme/text_styles.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:ka3da/core/widgets/custom_button.dart';

// class OnboardingContent {
//   final String image;
//   final String title;
//   final String description;

//   OnboardingContent({
//     required this.image,
//     required this.title,
//     required this.description,
//   });
// }

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;

//   final List<OnboardingContent> _contents = [
//     OnboardingContent(
//       image: 'assets/splash/onb_1.png',
//       title: 'A table for every\nmoment that\nmatters.',
//       description:
//           'Discover restaurants, book in seconds,\nand never miss a reservation.',
//     ),
//     OnboardingContent(
//       image: 'assets/splash/onb_2.png', // Replace later
//       title: 'Delicious food\nat your\nfingertips.',
//       description:
//           'Explore diverse menus from top-rated\nrestaurants around you.',
//     ),
//     OnboardingContent(
//       image: 'assets/splash/onb_3.png', // Replace later
//       title: 'Enjoy the best\ndining\nexperience.',
//       description:
//           'Book your table now and get ready for\nan unforgettable meal.',
//     ),
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.darkBackground,
//       body: Stack(
//         children: [
//           // Background Images and Text
//           PageView.builder(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             itemCount: _contents.length,
//             itemBuilder: (context, index) {
//               return Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   // Background Image
//                   Image.asset(_contents[index].image, fit: BoxFit.cover),

//                   // Gradient Overlay
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           AppColors.transparent,
//                           Colors.black.withValues(alpha: 0.2),
//                           Colors.black.withValues(alpha: 0.7),
//                           AppColors.darkerBackground,
//                         ],
//                         stops: const [0.0, 0.4, 0.7, 1.0],
//                       ),
//                     ),
//                   ),

//                   // Texts
//                   SafeArea(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 24.w,
//                         vertical: 24.h,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           // Title
//                           Text(
//                             _contents[index].title,
//                             style: AppTextStyles.hero.copyWith(
//                               color: AppColors.white,
//                               height: 1.1,
//                             ),
//                           ),

//                           SizedBox(height: 16.h),

//                           // Subtitle
//                           Text(
//                             _contents[index].description,
//                             style: AppTextStyles.body.copyWith(
//                               color: AppColors.white.withValues(alpha: .85),
//                               height: 1.5,
//                             ),
//                           ),

//                           // Space for indicator and button
//                           SizedBox(height: 130.h),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),

//           // Foreground UI (Skip, Indicator, Button)
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Skip Button
//                   _currentIndex == 2
//                       ? SizedBox()
//                       : Align(
//                           alignment: Alignment.topRight,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.pushReplacementNamed(
//                                 context,
//                                 AppRoutes.authGateScreen,
//                               );
//                             },
//                             style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                             ),
//                             child: Text(
//                               'Skip',
//                               style: AppTextStyles.body.copyWith(
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//                         ),

//                   const Spacer(),

//                   // Page Indicator
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: SmoothPageIndicator(
//                       controller: _pageController,
//                       count: _contents.length,
//                       effect: ExpandingDotsEffect(
//                         activeDotColor: AppColors.primaryDot,
//                         dotColor: Colors.grey.shade600,
//                         dotHeight: 6.h,
//                         dotWidth: 8.w,
//                         expansionFactor: 3,
//                         spacing: 6.w,
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 32.h),

//                   // Continue Button
//                   CustomButton(
//                     onPressed: () {
//                       if (_currentIndex < _contents.length - 1) {
//                         _pageController.nextPage(
//                           duration: const Duration(milliseconds: 300),
//                           curve: Curves.easeInOut,
//                         );
//                       } else {
//                         Navigator.pushReplacementNamed(
//                           context,
//                           AppRoutes.authGateScreen,
//                         );
//                       }
//                     },
//                     backgroundColor: AppColors.primary,
//                     child: Text(
//                       _currentIndex == 2 ? 'Get Started' : 'Continue',
//                       style: AppTextStyles.bodySemiBold.copyWith(
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
