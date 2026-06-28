import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilTestScreen extends StatelessWidget {
  const ScreenUtilTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      appBar: AppBar(
        title: Text(
          'ScreenUtil Test',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Device Info Card ──
            _buildInfoCard(),
            SizedBox(height: 20.h),

            // ── Section: Font Sizes (.sp) ──
            _buildSectionTitle('Font Sizes (.sp)'),
            SizedBox(height: 12.h),
            _buildFontSizeDemo(),
            SizedBox(height: 24.h),

            // ── Section: Width & Height (.w / .h) ──
            _buildSectionTitle('Width (.w) & Height (.h)'),
            SizedBox(height: 12.h),
            _buildSizeDemo(),
            SizedBox(height: 24.h),

            // ── Section: Padding & Margin ──
            _buildSectionTitle('Padding & Margin (.w / .h)'),
            SizedBox(height: 12.h),
            _buildPaddingDemo(),
            SizedBox(height: 24.h),

            // ── Section: Border Radius (.r) ──
            _buildSectionTitle('Border Radius (.r)'),
            SizedBox(height: 12.h),
            _buildRadiusDemo(),
            SizedBox(height: 24.h),

            // ── Section: Responsive Boxes ──
            _buildSectionTitle('Responsive Grid'),
            SizedBox(height: 12.h),
            _buildResponsiveGrid(),
            SizedBox(height: 24.h),

            // ── Section: Button Sizes ──
            _buildSectionTitle('Responsive Buttons'),
            SizedBox(height: 12.h),
            _buildButtonDemo(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  // ── Device Info Card ──
  Widget _buildInfoCard() {
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF3F3D9E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '📱 Device Info',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12.h),
              _infoRow('Screen Width', '${1.sw.toStringAsFixed(1)} px'),
              _infoRow('Screen Height', '${1.sh.toStringAsFixed(1)} px'),
              _infoRow('Design Size', '393 × 852'),
              _infoRow('Scale Width', '${ScreenUtil().scaleWidth.toStringAsFixed(3)}'),
              _infoRow('Scale Height', '${ScreenUtil().scaleHeight.toStringAsFixed(3)}'),
              _infoRow('Text Scale Factor', '${ScreenUtil().scaleText.toStringAsFixed(3)}'),
              _infoRow('Pixel Ratio', '${ScreenUtil().pixelRatio?.toStringAsFixed(2) ?? 'N/A'}'),
              _infoRow('Status Bar Height', '${ScreenUtil().statusBarHeight.toStringAsFixed(1)} px'),
              _infoRow('Bottom Bar Height', '${ScreenUtil().bottomBarHeight.toStringAsFixed(1)} px'),
            ],
          ),
        );
      },
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.white70,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ── Section Title ──
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF8B85FF),
        letterSpacing: 0.5,
      ),
    );
  }

  // ── Font Size Demo ──
  Widget _buildFontSizeDemo() {
    final sizes = [10.0, 14.0, 18.0, 24.0, 32.0];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF2A2A4A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sizes.map((size) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Row(
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(
                    '${size.toInt()}.sp',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF6C63FF),
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'The quick brown fox',
                    style: TextStyle(
                      fontSize: size.sp,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── Size Demo (.w / .h) ──
  Widget _buildSizeDemo() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF2A2A4A)),
      ),
      child: Column(
        children: [
          _sizeRow('50.w × 50.h', 50.w, 50.h, const Color(0xFFFF6B6B)),
          SizedBox(height: 12.h),
          _sizeRow('100.w × 40.h', 100.w, 40.h, const Color(0xFF4ECDC4)),
          SizedBox(height: 12.h),
          _sizeRow('150.w × 30.h', 150.w, 30.h, const Color(0xFFFFE66D)),
          SizedBox(height: 12.h),
          _sizeRow('200.w × 60.h', 200.w, 60.h, const Color(0xFFA8E6CF)),
        ],
      ),
    );
  }

  Widget _sizeRow(String label, double width, double height, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.white70,
              fontFamily: 'monospace',
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.3),
            border: Border.all(color: color, width: 1.5),
            borderRadius: BorderRadius.circular(6.r),
          ),
          alignment: Alignment.center,
          child: Text(
            '${width.toStringAsFixed(0)}×${height.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 10.sp,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // ── Padding Demo ──
  Widget _buildPaddingDemo() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF2A2A4A)),
      ),
      child: Column(
        children: [
          _paddingDemoItem('8.w padding', EdgeInsets.all(8.w), const Color(0xFFFF6B6B)),
          SizedBox(height: 10.h),
          _paddingDemoItem('16.w padding', EdgeInsets.all(16.w), const Color(0xFF4ECDC4)),
          SizedBox(height: 10.h),
          _paddingDemoItem('24.w padding', EdgeInsets.all(24.w), const Color(0xFFFFE66D)),
          SizedBox(height: 10.h),
          _paddingDemoItem(
            'H:20.w V:8.h',
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            const Color(0xFFA8E6CF),
          ),
        ],
      ),
    );
  }

  Widget _paddingDemoItem(String label, EdgeInsets padding, Color color) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Container(
        padding: padding,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: color, width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // ── Border Radius Demo ──
  Widget _buildRadiusDemo() {
    final radii = [4.0, 8.0, 16.0, 24.0, 40.0];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF2A2A4A)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: radii.map((r) {
          return Column(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                  ),
                  borderRadius: BorderRadius.circular(r.r),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                '${r.toInt()}.r',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.white70,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ── Responsive Grid ──
  Widget _buildResponsiveGrid() {
    final colors = [
      const Color(0xFFFF6B6B),
      const Color(0xFF4ECDC4),
      const Color(0xFFFFE66D),
      const Color(0xFF6C63FF),
      const Color(0xFFA8E6CF),
      const Color(0xFFFF8E53),
    ];

    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: List.generate(6, (index) {
        return Container(
          width: 165.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: colors[index].withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: colors[index].withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '165.w × 80.h',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colors[index],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Card ${index + 1}',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: colors[index].withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // ── Button Demo ──
  Widget _buildButtonDemo() {
    return Column(
      children: [
        // Full width button
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Full Width Button (50.h)',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        // Two buttons side by side
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 44.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4ECDC4),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Button A',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SizedBox(
                height: 44.h,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFFF6B6B),
                    side: BorderSide(color: const Color(0xFFFF6B6B), width: 1.5.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Button B',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        // Small button
        SizedBox(
          width: 160.w,
          height: 36.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF8E53),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            child: Text(
              '160.w × 36.h',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
