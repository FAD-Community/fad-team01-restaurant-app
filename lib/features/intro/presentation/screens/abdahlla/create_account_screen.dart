// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:ka3da/core/routing/app_routes.dart';
// import 'package:ka3da/core/theme/colors.dart';
// import 'package:ka3da/core/theme/text_styles.dart';
// import 'package:ka3da/core/widgets/custom_back_button.dart';
// import 'package:ka3da/core/widgets/custom_button.dart';

// class CreateAccountScreen extends StatefulWidget {
//   const CreateAccountScreen({super.key});

//   @override
//   State<CreateAccountScreen> createState() => _CreateAccountScreenState();
// }

// class _CreateAccountScreenState extends State<CreateAccountScreen> {
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackground,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomBackButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(
//                     context,
//                     AppRoutes.authGateScreen,
//                   );
//                 },
//               ),
//               SizedBox(height: 24.h),
//               Text('Create Account', style: AppTextStyles.h1),
//               SizedBox(height: 4.h),
//               Text(
//                 'Join now to start booking your dream dining\nexperiences.',
//                 style: AppTextStyles.bodyMedium.copyWith(
//                   color: AppColors.textSecondary,
//                 ),
//               ),
//               SizedBox(height: 24.h),

//               // Full Name
//               _buildLabel('Full Name'),
//               _buildTextField(
//                 hint: 'Enter your name',
//                 prefixIcon: Icons.person_outline,
//               ),
//               SizedBox(height: 12.h),

//               // Email Address
//               _buildLabel('Email Address'),
//               _buildTextField(
//                 hint: 'Enter your email',
//                 prefixIcon: Icons.mail_outline,
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(height: 12.h),

//               // Password
//               _buildLabel('Password'),
//               _buildTextField(
//                 hint: 'Enter your password',
//                 prefixIcon: Icons.lock_outline,
//                 isPassword: true,
//                 obscureText: _obscurePassword,
//                 onToggleVisibility: () {
//                   setState(() {
//                     _obscurePassword = !_obscurePassword;
//                   });
//                 },
//               ),
//               SizedBox(height: 12.h),

//               // Confirm Password
//               _buildLabel('Confirm Password'),
//               _buildTextField(
//                 hint: 'Confirm your password',
//                 prefixIcon: Icons.lock_outline,
//                 isPassword: true,
//                 obscureText: _obscureConfirmPassword,
//                 onToggleVisibility: () {
//                   setState(() {
//                     _obscureConfirmPassword = !_obscureConfirmPassword;
//                   });
//                 },
//               ),
//               SizedBox(height: 24.h),

//               // Sign Up Button
//               CustomButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
//                 },
//                 backgroundColor: AppColors.primary,
//                 child: Text(
//                   'Sign up',
//                   style: AppTextStyles.bodySemiBold.copyWith(
//                     color: AppColors.white,
//                   ),
//                 ),
//               ),

//               SizedBox(height: 24.h),

//               // Or continue with Divider
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(color: AppColors.divider, thickness: 1),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     child: Text(
//                       'or continue with',
//                       style: AppTextStyles.caption.copyWith(
//                         color: AppColors.textSecondary,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(color: AppColors.divider, thickness: 1),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 20.h),

//               // Social Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Google Button
//                   Container(
//                     width: 50.w,
//                     height: 50.w,
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: SvgPicture.asset(
//                         'assets/splash/google_icon.svg',
//                         width: 22.w,
//                         height: 22.w,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 24.w),
//                   // Apple Button
//                   Container(
//                     width: 50.w,
//                     height: 50.w,
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: SvgPicture.asset(
//                         'assets/splash/apple_icon.svg',
//                         width: 22.w,
//                         height: 22.w,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 24.h),

//               // Sign In Link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Already have an account? ',
//                     style: AppTextStyles.bodyMedium.copyWith(
//                       color: AppColors.textSecondary,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacementNamed(
//                         context,
//                         AppRoutes.loginscreen,
//                       );
//                     },
//                     child: Text(
//                       'Sign in',
//                       style: AppTextStyles.bodySemiBold.copyWith(
//                         color: AppColors.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Text(text, style: AppTextStyles.body),
//     );
//   }

//   Widget _buildTextField({
//     required String hint,
//     required IconData prefixIcon,
//     bool isPassword = false,
//     bool obscureText = false,
//     VoidCallback? onToggleVisibility,
//     TextInputType? keyboardType,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(16.r),
//       ),
//       child: TextField(
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         style: AppTextStyles.bodyMedium,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: AppTextStyles.bodyMedium.copyWith(
//             color: AppColors.textHint,
//           ),
//           prefixIcon: Icon(
//             prefixIcon,
//             color: Colors.grey.shade400,
//             size: 20.sp,
//           ),
//           suffixIcon: isPassword
//               ? IconButton(
//                   icon: Icon(
//                     obscureText
//                         ? Icons.visibility_off_outlined
//                         : Icons.visibility_outlined,
//                     color: Colors.grey.shade400,
//                     size: 20.sp,
//                   ),
//                   onPressed: onToggleVisibility,
//                 )
//               : null,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16.r),
//             borderSide: BorderSide.none,
//           ),
//           filled: true,
//           fillColor: AppColors.white,
//           contentPadding: EdgeInsets.symmetric(vertical: 14.h),
//         ),
//       ),
//     );
//   }
// }
