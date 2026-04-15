import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0A0A0F);
  static const surface = Color(0xFF111118);
  static const surfaceLight = Color(0xFF1A1A25);
  static const border = Color(0xFF1E1E2E);
  static const borderLight = Color(0xFF2A2A3A);
  static const accent = Color(0xFF00E5C3);
  static const accentDark = Color(0xFF00B89C);
  static const purple = Color(0xFF8B5CF6);
  static const textPrimary = Color(0xFFEEEEEE);
  static const textSecondary = Color(0xFF9CA3AF);
  static const textMuted = Color(0xFF6B7280);
}

class AppTextStyles {
  static const _font = 'Space Grotesk';

  static const h1 = TextStyle(
    fontFamily: _font,
    fontSize: 60,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.1,
    letterSpacing: -1.5,
  );

  static const h2 = TextStyle(
    fontFamily: _font,
    fontSize: 42,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.15,
    letterSpacing: -1,
  );

  static const h3 = TextStyle(
    fontFamily: _font,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const bodyLarge = TextStyle(
    fontFamily: _font,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.7,
  );

  static const body = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.7,
  );

  static const caption = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
    height: 1.5,
  );

  static const overline = TextStyle(
    fontFamily: _font,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
    letterSpacing: 3,
    height: 1.5,
  );

  static const navLink = TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.5,
  );
}

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1024;
bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= 768 &&
    MediaQuery.of(context).size.width < 1024;
bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < 768;

double contentPadding(BuildContext context) {
  if (isDesktop(context)) return 80;
  if (isTablet(context)) return 40;
  return 24;
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final List<Color> colors;

  const GradientText(
    this.text, {
    super.key,
    required this.style,
    this.colors = const [AppColors.accent, AppColors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(colors: colors).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}

class ContentWrapper extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  const ContentWrapper({
    super.key,
    required this.child,
    this.maxWidth = 1200,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(horizontal: contentPadding(context)),
          child: child,
        ),
      ),
    );
  }
}

class GradientOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const GradientOrb({
    super.key,
    required this.size,
    required this.color,
    this.opacity = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: opacity),
            color.withValues(alpha: opacity * 0.3),
            Colors.transparent,
          ],
          stops: const [0, 0.5, 1],
        ),
      ),
    );
  }
}
