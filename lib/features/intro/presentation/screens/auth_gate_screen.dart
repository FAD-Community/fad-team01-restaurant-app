import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class AuthGateScreen extends StatefulWidget {
  const AuthGateScreen({super.key});

  @override
  State<AuthGateScreen> createState() => _AuthGateScreenState();
}

class _AuthGateScreenState extends State<AuthGateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Curved Section
            ClipPath(
              clipper: _TopCurveClipper(),
              child: Container(
                width: double.infinity,
                height: 320.h,
                color: AppColors.darkBackground,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Qa3da',
                        style: AppTextStyles.displayLarge,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Book your perfect dining\nexperience in seconds.',
                        style: AppTextStyles.descriptionLight.copyWith(
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 60.h), // Push content up a bit
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  // Create Account Button
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.createAccountScreen,
                      );
                    },
                    backgroundColor: AppColors.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: AppColors.white,
                          size: 22.sp,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Create Account',
                          style: AppTextStyles.buttonLarge.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Or continue with Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.divider,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'or continue with',
                          style: AppTextStyles.dividerText,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.divider,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google Button
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/splash/google_icon.svg',
                            width: 24.w,
                            height: 24.w,
                          ),
                        ),
                      ),
                      SizedBox(width: 24.w),
                      // Apple Button
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/splash/apple_icon.svg',
                            width: 24.w,
                            height: 24.w,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  // Continue as Guest Button
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.mainLayout,
                      );
                    },
                    backgroundColor: AppColors.transparent,
                    border: const BorderSide(color: Colors.black87, width: 1),
                    child: Text(
                      'Continue as Guest',
                      style: AppTextStyles.buttonLarge.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.loginscreen);
                        },
                        child: Text(
                          'Sign in',
                          style: AppTextStyles.linkPrimary,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    // Draw bezier curve to bottom right
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height + 20,
      size.width,
      size.height - 140,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
