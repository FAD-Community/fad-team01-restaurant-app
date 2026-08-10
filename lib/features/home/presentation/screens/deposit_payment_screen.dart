import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:ka3da/features/home/presentation/screens/review_reservation_screen.dart';
import 'package:ka3da/features/home/presentation/widgets/deposit_payment/alert_note.dart';
import 'package:ka3da/features/home/presentation/widgets/deposit_payment/dashed_upload_box.dart';
import 'package:ka3da/features/home/presentation/widgets/deposit_payment/payment_method_card.dart';
import 'package:ka3da/features/home/presentation/widgets/deposit_payment/total_deposit_card.dart';
import 'package:ka3da/features/home/presentation/widgets/reserve_table/step_pill.dart';

class DepositPaymentScreen extends StatefulWidget {
  const DepositPaymentScreen({super.key, required this.args});

  final ReviewReservationArgs args;

  @override
  State<DepositPaymentScreen> createState() => _DepositPaymentScreenState();
}

class _DepositPaymentScreenState extends State<DepositPaymentScreen> {
  String _selectedPayment = 'visa';
  File? _receiptFile;
  bool _isUploading = false;

  final List<Map<String, dynamic>> _paymentMethods = [
    {'id': 'visa', 'asset': 'assets/deposit/visa.svg', 'label': 'Visa'},
    {
      'id': 'vodafone',
      'asset': 'assets/deposit/vodafone.svg',
      'label': 'Vodafone',
    },
    {
      'id': 'instapay',
      'asset': 'assets/deposit/instapay.svg',
      'label': 'Instapay',
    },
  ];

  Future<void> _pickReceipt() async {
    try {
      setState(() => _isUploading = true);
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        imageQuality: 80,
      );
      if (picked != null) {
        setState(() {
          _receiptFile = File(picked.path);
        });
      }
    } catch (_) {
      // Platform not available (e.g. desktop preview) — silently ignore
    } finally {
      setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.args.restaurant;
    final args =
        ModalRoute.of(context)?.settings.arguments as ReviewReservationArgs?;
    if (args == null) {
      return const Scaffold(body: Center(child: Text("No Reservation Data")));
    }

    final canSubmit = _receiptFile != null;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────────────
            Container(
              color: AppColors.scaffoldBackground,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: const BoxDecoration(
                            color: Color(0xffF2ECE4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16.sp,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      Gap(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deposit Payment',
                            style: AppTextStyles.h2.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            restaurant.name,
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xffA89785),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(16.h),
                  Text(
                    'Step 3 of 3',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff8C7461),
                    ),
                  ),
                  Gap(8.h),
                  // Full-width active progress bar
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  Gap(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      StepPill(title: 'Details', isActive: true),
                      StepPill(title: 'Review', isActive: true),
                      StepPill(title: 'Payment', isActive: true),
                    ],
                  ),
                ],
              ),
            ),

            // ── Scrollable body ─────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Total Deposit card
                    const TotalDepositCard(amount: 150),

                    Gap(24.h),

                    // Payment Methods
                    Text(
                      'Payment Methods',
                      style: AppTextStyles.h2.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _paymentMethods
                          .map(
                            (m) => PaymentMethodCard(
                              method: m,
                              isSelected: _selectedPayment == m['id'],
                              onTap: () => setState(
                                () => _selectedPayment = m['id'] as String,
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    Gap(20.h),

                    // Alert note
                    const AlertNote(
                      text:
                          'Please transfer the amount first, then return here to upload your receipt',
                    ),

                    Gap(14.h),

                    // Dashed upload box
                    DashedUploadBox(
                      receiptFile: _receiptFile,
                      isUploading: _isUploading,
                      onPickReceipt: _pickReceipt,
                      onRemoveReceipt: () =>
                          setState(() => _receiptFile = null),
                    ),

                    Gap(24.h),

                    // Confirm & Submit button
                    CustomButton(
                      backgroundColor: canSubmit
                          ? AppColors.primary
                          : AppColors.buttonDisabled,
                      onPressed: () async {
                        if (!canSubmit) return;

                        // Show the loading/verifying dialog
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: Colors.black.withValues(alpha: 0.35),
                          builder: (_) => Dialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            insetPadding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 60.h,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 28.w,
                                vertical: 36.h,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 64.w,
                                    width: 64.w,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Gap(28.h),
                                  Text(
                                    'Verifying Your Payment',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.h2.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  Gap(12.h),
                                  Text(
                                    'We are checking your receipt. This usually\ntakes a few seconds.',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColors.textMuted,
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );

                        // Simulate async verification (3 seconds)
                        final nav = Navigator.of(context);
                        await Future.delayed(const Duration(seconds: 3));

                        if (!mounted) return;

                        // Dismiss loading dialog
                        nav.pop();

                        // Show success dialog
                        if (!mounted) return;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: Colors.black.withValues(alpha: 0.35),
                          builder: (ctx) {
                            const confirmCode = 'TH-MJE2W';
                            return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 60.h,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 28.w,
                                  vertical: 32.h,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Green check SVG
                                    SvgPicture.asset(
                                      'assets/splash/check_icon.svg',
                                      height: 72.w,
                                      width: 72.w,
                                    ),
                                    Gap(20.h),
                                    Text(
                                      'Booking Confirmed!',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.h2.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    Gap(10.h),
                                    Text(
                                      'Your table is ready!\nYour deposit has been received.',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.body.copyWith(
                                        fontSize: 14.sp,
                                        color: AppColors.textMuted,
                                        height: 1.6,
                                      ),
                                    ),
                                    Gap(20.h),
                                    // Confirmation Code row
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 12.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFAF3E6),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Confirmation Code',
                                            style: AppTextStyles.caption
                                                .copyWith(
                                                  fontSize: 11.sp,
                                                  color: AppColors.textMuted,
                                                ),
                                          ),
                                          Gap(6.h),
                                          Row(
                                            children: [
                                              Text(
                                                confirmCode,
                                                style: AppTextStyles.h2
                                                    .copyWith(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.textDark,
                                                      letterSpacing: 1.5,
                                                    ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Clipboard.setData(
                                                    const ClipboardData(
                                                      text: confirmCode,
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(
                                                    ctx,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: const Text(
                                                        'Code copied!',
                                                      ),
                                                      backgroundColor:
                                                          AppColors.primary,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      duration: const Duration(
                                                        seconds: 2,
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10.r,
                                                            ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 12.w,
                                                    vertical: 6.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.textDark,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.r,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.copy_rounded,
                                                        size: 14.sp,
                                                        color: Colors.white,
                                                      ),
                                                      Gap(4.w),
                                                      Text(
                                                        'Copy',
                                                        style: AppTextStyles
                                                            .caption
                                                            .copyWith(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(24.h),
                                    // Done button
                                    SizedBox(
                                      width: double.infinity,
                                      height: 52.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // 1) Close the dialog and go back to MainLayout in the root navigator
                                          Navigator.of(
                                            ctx,
                                            rootNavigator: true,
                                          ).popUntil(
                                            (route) =>
                                                route.settings.name ==
                                                AppRoutes.mainLayout,
                                          );

                                          // 2) Clear the booking screens from the tab's nested navigator
                                          Navigator.of(
                                            ctx,
                                          ).popUntil((route) => route.isFirst);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          'Done',
                                          style: AppTextStyles.button.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Confirm & Submit Booking',
                        style: AppTextStyles.button.copyWith(
                          color: canSubmit
                              ? Colors.white
                              : AppColors.textMuted.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                    Gap(24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
