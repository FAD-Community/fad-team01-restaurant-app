// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ka3da/core/widgets/custom_button.dart';
// import 'package:ka3da/core/routing/app_routes.dart';

// class ForgetPasswordScreen extends StatefulWidget {
//   const ForgetPasswordScreen({super.key});

//   @override
//   State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
// }

// class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F1E8),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 16.h),
              
//               // Progress Bar
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 4.h,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF8B2527),
//                         borderRadius: BorderRadius.circular(2.r),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8.w),
//                   Expanded(
//                     child: Container(
//                       height: 4.h,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFE2DACC),
//                         borderRadius: BorderRadius.circular(2.r),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8.w),
//                   Expanded(
//                     child: Container(
//                       height: 4.h,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFE2DACC),
//                         borderRadius: BorderRadius.circular(2.r),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
              
//               SizedBox(height: 40.h),
              
//               Text(
//                 'Forget Password?',
//                 style: TextStyle(
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Text(
//                 'Got you! Enter your email address below, and\nwe\'ll send you a code to reset it.',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: Colors.grey.shade700,
//                   height: 1.4,
//                 ),
//               ),
              
//               SizedBox(height: 32.h),

//               // Email Address
//               _buildLabel('Email Address'),
//               _buildTextField(
//                 hint: 'Enter your email',
//                 prefixIcon: Icons.mail_outline,
//                 keyboardType: TextInputType.emailAddress,
//               ),
              
//               SizedBox(height: 32.h),

//               // Send Code Button
//               CustomButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoutes.otpScreen);
//                 },
//                 backgroundColor: const Color(0xFF8B2527),
//                 child: Text(
//                   'Send Code',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w500,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String hint,
//     required IconData prefixIcon,
//     TextInputType? keyboardType,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16.r),
//       ),
//       child: TextField(
//         keyboardType: keyboardType,
//         style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
//           prefixIcon: Icon(prefixIcon, color: Colors.grey.shade400, size: 20.sp),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(16.r),
//             borderSide: BorderSide.none,
//           ),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.symmetric(vertical: 14.h),
//         ),
//       ),
//     );
//   }
// }