// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:ka3da/core/widgets/custom_button.dart';
// import 'package:ka3da/core/routing/app_routes.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   bool _isCodeComplete = false;

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
//                         color: const Color(0xFFE2DACC),
//                         borderRadius: BorderRadius.circular(2.r),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
              
//               SizedBox(height: 40.h),
              
//               Text(
//                 'Enter Code',
//                 style: TextStyle(
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Text(
//                 'We sent a 4-digit code to your email',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: Colors.grey.shade700,
//                   height: 1.4,
//                 ),
//               ),
              
//               SizedBox(height: 40.h),

//               // OTP Fields
//               OtpTextField(
//                 numberOfFields: 4,
//                 borderColor: const Color(0xFF4CAF50),
//                 focusedBorderColor: const Color(0xFF4CAF50),
//                 enabledBorderColor: Colors.transparent, // transparent when empty
//                 showFieldAsBox: true,
//                 fieldWidth: 65.w,
//                 borderRadius: BorderRadius.circular(16.r),
//                 filled: true,
//                 fillColor: Colors.white,
//                 textStyle: TextStyle(
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 onCodeChanged: (String code) {
//                   setState(() {
//                     _isCodeComplete = false;
//                   });
//                 },
//                 onSubmit: (String verificationCode){
//                   setState(() {
//                     _isCodeComplete = true;
//                   });
//                 },
//               ),
              
//               SizedBox(height: 40.h),

//               // Verify Button
//               CustomButton(
//                 onPressed: _isCodeComplete ? () {
//                   Navigator.pushNamed(context, AppRoutes.createNewPasswordScreen);
//                 } : () {},
//                 backgroundColor: _isCodeComplete ? const Color(0xFF8B2527) : const Color(0xFFDFD4C5),
//                 child: Text(
//                   'Verify',
//                   style: TextStyle(
//                     color: _isCodeComplete ? Colors.white : Colors.grey.shade600,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
              
//               SizedBox(height: 24.h),

//               // Resend Code
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Didn\'t receive it? ',
//                     style: TextStyle(
//                       color: Colors.grey.shade700,
//                       fontSize: 13.sp,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Resent Code',
//                       style: TextStyle(
//                         color: const Color(0xFFB56A54),
//                         fontSize: 13.sp,
//                         fontWeight: FontWeight.w500,
//                         decoration: TextDecoration.underline,
//                         decorationColor: const Color(0xFFB56A54),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
