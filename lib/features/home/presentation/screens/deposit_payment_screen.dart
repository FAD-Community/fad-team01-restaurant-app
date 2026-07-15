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

class DepositPaymentScreen extends StatefulWidget {
  const DepositPaymentScreen({super.key});

  @override
  State<DepositPaymentScreen> createState() => _DepositPaymentScreenState();
}

class _DepositPaymentScreenState extends State<DepositPaymentScreen> {
  String _selectedPayment = 'visa';
  File? _receiptFile;
  bool _isUploading = false;

  final List<Map<String, dynamic>> _paymentMethods = [
    {'id': 'visa', 'asset': 'assets/icons/icons8-visa.svg', 'label': 'Visa'},
    {
      'id': 'vodafone',
      'asset': 'assets/icons/vodafone-icon.svg',
      'label': 'Vodafone',
    },
    {
      'id': 'instapay',
      'asset': 'assets/icons/InstaPay-logobase.net.svg',
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

  Widget _buildStepPill(String title, {required bool isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : const Color(0xffEEDEC9),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        title,
        style: AppTextStyles.captionlarge.copyWith(
          fontSize: 12.sp,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? Colors.white : const Color(0xff8C7461),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(Map<String, dynamic> method) {
    final isSelected = _selectedPayment == method['id'];
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = method['id'] as String),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isSelected ? 0.06 : 0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SvgPicture.asset(
          method['asset'] as String,
          height: 28.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildDashedUploadBox() {
    return GestureDetector(
      onTap: _receiptFile == null ? _pickReceipt : null,
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: const Color(0xffC4A882),
          borderRadius: 16,
          dashWidth: 8,
          dashSpace: 5,
        ),
        child: Container(
          width: double.infinity,
          height: 220.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: _receiptFile != null
              ? _buildUploadedReceipt()
              : _buildUploadPrompt(),
        ),
      ),
    );
  }

  Widget _buildUploadPrompt() {
    return _isUploading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  color: AppColors.textDark,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
              Gap(16),
              Text(
                'Upload payment receipt',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              Gap(6),
              Text(
                'Click here to upload your',
                style: AppTextStyles.caption.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.textMuted,
                ),
              ),
              Text(
                'screenshot',
                style: AppTextStyles.caption.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          );
  }

  Widget _buildUploadedReceipt() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: Image.file(
            _receiptFile!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: GestureDetector(
            onTap: () => setState(() => _receiptFile = null),
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 18.sp,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'Tap ✕ to remove',
                style: AppTextStyles.caption.copyWith(
                  color: Colors.white,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      Gap(16),
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
                            'The Grill House',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xffA89785),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(16),
                  Text(
                    'Step 3 of 3',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff8C7461),
                    ),
                  ),
                  Gap(8),
                  // Full-width active progress bar
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStepPill('Details', isActive: true),
                      _buildStepPill('Review', isActive: true),
                      _buildStepPill('Payment', isActive: true),
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 22.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Total Deposit',
                            style: AppTextStyles.captionMedium.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Gap(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '150',
                                style: AppTextStyles.h2.copyWith(
                                  fontSize: 42.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark,
                                ),
                              ),
                              Gap(6),
                              Text(
                                'EGP',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          Gap(4),
                          Text(
                            '(Refundable upon arrival)',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Gap(24),

                    // Payment Methods
                    Text(
                      'Payment Methods',
                      style: AppTextStyles.h2.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _paymentMethods
                          .map((m) => _buildPaymentMethod(m))
                          .toList(),
                    ),

                    Gap(20),

                    // Alert note
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: const Color(0xffA33E32),
                          size: 16.sp,
                        ),
                        Gap(6),
                        Expanded(
                          child: Text(
                            'Please transfer the amount first, then return here to upload your receipt',
                            style: TextStyle(
                              fontFamily: AppTextStyles.bodyFont,
                              fontSize: 12.sp,
                              color: const Color(0xffA33E32),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Gap(14),

                    // Dashed upload box
                    _buildDashedUploadBox(),

                    Gap(24),

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
                                  Gap(28),
                                  Text(
                                    'Verifying Your Payment',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.h2.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  Gap(12),
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
                                    Gap(20),
                                    Text(
                                      'Booking Confirmed!',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.h2.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    Gap(10),
                                    Text(
                                      'Your table is ready!\nYour deposit has been received.',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.body.copyWith(
                                        fontSize: 14.sp,
                                        color: AppColors.textMuted,
                                        height: 1.6,
                                      ),
                                    ),
                                    Gap(20),
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
                                          Gap(6),
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
                                                      Gap(4),
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
                                    Gap(24),
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
                    Gap(24),
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

// ── Dashed border painter ─────────────────────────────────────────────────────
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;
  final double dashWidth;
  final double dashSpace;

  const _DashedBorderPainter({
    required this.color,
    this.borderRadius = 12,
    this.dashWidth = 8,
    this.dashSpace = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final path = Path()..addRRect(rRect);
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) =>
      old.color != color ||
      old.dashWidth != dashWidth ||
      old.dashSpace != dashSpace;
}
