import 'dart:ui';
import 'package:flutter/material.dart';

/// Reusable "Glass" surface.
///
/// Maps to the Figma spec:
/// - Corner radius        -> borderRadius (12)
/// - Fill #FFFEFC 100%    -> tintColor
/// - Glass angle -45°     -> gradient direction (topLeft -> bottomRight)
/// - Glass intensity 80%  -> tintOpacity
/// - Padding 24 / 12      -> padding
class GlassContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double blurSigma;
  final Color tintColor;
  final double tintOpacity;
  final double borderOpacity;
  final Widget child;

  const GlassContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.blurSigma = 14,
    this.tintColor = const Color(0xFFFFFEFC),
    this.tintOpacity = 0.8,
    this.borderOpacity = 0.22,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        // This is what actually blurs whatever sits BEHIND the widget.
        // On a flat solid background it won't look "glassy" — it needs
        // something behind it (image, gradient, other content) to blur.
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            // -45°: brighter at top-left, fading toward bottom-right
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                tintColor.withOpacity(0.16 * tintOpacity),
                tintColor.withOpacity(0.05 * tintOpacity),
              ],
            ),
            border: Border.all(
              width: 1,
              color: Colors.white.withOpacity(borderOpacity),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Exact reproduction of the card in the screenshot (112 x 63, heart + count,
/// "Saved" label, 12px gap between the two rows).
class GlassStatCard extends StatelessWidget {
  final String count;
  final String label;
  final bool filled;
  final VoidCallback? onTap;

  const GlassStatCard({
    super.key,
    this.count = '3',
    this.label = 'Saved',
    this.filled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        width: 112,
        height: 63,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  filled ? Icons.favorite : Icons.favorite_border,
                  size: 16,
                  color: Colors.white,
                ),
                const SizedBox(width: 6),
                Text(
                  count,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12), // gap: 12
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Quick preview page — run this to see it against a real background,
/// since the glass/blur effect only reads correctly over something behind it.
class GlassPreviewPage extends StatelessWidget {
  const GlassPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1441974231531-c6227db76b6e',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: GlassStatCard(),
        ),
      ),
    );
  }
}