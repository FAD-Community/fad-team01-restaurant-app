// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:ka3da/core/widgets/custom_button.dart';
// import 'package:ka3da/core/routing/app_routes.dart';

// class CreateNewPasswordScreen extends StatefulWidget {
//   const CreateNewPasswordScreen({super.key});

//   @override
//   State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
// }

// class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;

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
//                         color: const Color(0xFF8B2527),
//                         borderRadius: BorderRadius.circular(2.r),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
              
//               SizedBox(height: 40.h),
              
//               Text(
//                 'Create New Password',
//                 style: TextStyle(
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Text(
//                 'Your new password must be different from your\nprevious password.',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: Colors.grey.shade700,
//                   height: 1.4,
//                 ),
//               ),
              
//               SizedBox(height: 32.h),

//               // New Password
//               _buildLabel('New Password'),
//               _buildTextField(
//                 hint: 'Enter your password',
//                 prefixIcon: Icons.lock_outline,
//                 isPassword: true,
//                 obscureText: _obscureNew,
//                 onToggleVisibility: () {
//                   setState(() {
//                     _obscureNew = !_obscureNew;
//                   });
//                 },
//               ),
              
//               SizedBox(height: 16.h),
              
//               // Confirm Password
//               _buildLabel('Confirm Password'),
//               _buildTextField(
//                 hint: 'Confirm your password',
//                 prefixIcon: Icons.lock_outline,
//                 isPassword: true,
//                 obscureText: _obscureConfirm,
//                 onToggleVisibility: () {
//                   setState(() {
//                     _obscureConfirm = !_obscureConfirm;
//                   });
//                 },
//               ),
              
//               SizedBox(height: 40.h),

//               // Reset Password Button
//               CustomButton(
//                 onPressed: () {
//                   _showSuccessBottomSheet();
//                 },
//                 backgroundColor: const Color(0xFF8B2527),
//                 child: Text(
//                   'Reset Password',
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

//   void _showSuccessBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       isDismissible: false,
//       enableDrag: false,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(32.r),
//               topRight: Radius.circular(32.r),
//             ),
//           ),
//           padding: EdgeInsets.only(
//             left: 24.w,
//             right: 24.w,
//             top: 40.h,
//             bottom: 40.h + MediaQuery.of(context).padding.bottom,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Success Icon
//               SvgPicture.asset(
//                 'assets/splash/check_icon.svg',
//                 width: 90.sp,
//                 height: 90.sp,
//               ),
//               SizedBox(height: 20.h),
//               Text(
//                 'Password Updated!',
//                 style: TextStyle(
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Text(
//                 'Your password has been reset successfully.\nYou can now log in with your new password.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: Colors.grey.shade600,
//                   height: 1.4,
//                 ),
//               ),
//               SizedBox(height: 32.h),
//               CustomButton(
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                     context,
//                     AppRoutes.loginscreen,
//                     (route) => false,
//                   );
//                 },
//                 backgroundColor: const Color(0xFF8B2527),
//                 child: Text(
//                   'Back To Log in',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
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
//     bool isPassword = false,
//     bool obscureText = false,
//     VoidCallback? onToggleVisibility,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16.r),
//       ),
//       child: TextField(
//         obscureText: obscureText,
//         style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
//           prefixIcon: Icon(prefixIcon, color: Colors.grey.shade400, size: 20.sp),
//           suffixIcon: isPassword
//               ? IconButton(
//                   icon: Icon(
//                     obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.symmetric(vertical: 14.h),
//         ),
//       ),
//     );
//   }
// }
