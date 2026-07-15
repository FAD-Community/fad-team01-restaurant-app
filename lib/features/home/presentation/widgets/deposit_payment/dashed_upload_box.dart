import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class DashedUploadBox extends StatelessWidget {
  final File? receiptFile;
  final bool isUploading;
  final VoidCallback onPickReceipt;
  final VoidCallback onRemoveReceipt;

  const DashedUploadBox({
    super.key,
    required this.receiptFile,
    required this.isUploading,
    required this.onPickReceipt,
    required this.onRemoveReceipt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: receiptFile == null ? onPickReceipt : null,
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
          child: receiptFile != null
              ? _buildUploadedReceipt()
              : _buildUploadPrompt(),
        ),
      ),
    );
  }

  Widget _buildUploadPrompt() {
    return isUploading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 52.w,
                height: 52.w,
                decoration: const BoxDecoration(
                  color: AppColors.textDark,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
              Gap(16.h),
              Text(
                'Upload payment receipt',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              Gap(6.h),
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
            receiptFile!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: GestureDetector(
            onTap: onRemoveReceipt,
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
}

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
