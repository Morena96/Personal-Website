import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';
import 'package:personal_website/widgets/gradient_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);
    final mobile = isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight < 700 ? 700 : screenHeight,
      child: Stack(
        children: [
          // Background gradient orbs
          Positioned(
            top: -80,
            right: desktop ? 0 : -100,
            child: const GradientOrb(
              size: 600,
              color: AppColors.accent,
              opacity: 0.08,
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: const GradientOrb(
              size: 500,
              color: AppColors.purple,
              opacity: 0.06,
            ),
          ),

          // Content
          ContentWrapper(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (desktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _buildTextContent(context)),
                      const SizedBox(width: 60),
                      Expanded(child: _buildCodeCard(context)),
                    ],
                  )
                else ...[
                  _buildTextContent(context, centered: true),
                  if (!mobile) ...[
                    const SizedBox(height: 60),
                    SizedBox(
                      width: 500,
                      child: _buildCodeCard(context),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, {bool centered = false}) {
    final mobile = isMobile(context);
    final align = centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.left;

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          'FULL-STACK SOFTWARE ENGINEER',
          style: AppTextStyles.overline,
          textAlign: textAlign,
        ),
        const SizedBox(height: 24),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'I build '),
              TextSpan(
                text: 'scalable products',
                style: TextStyle(
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [AppColors.accent, AppColors.purple],
                    ).createShader(const Rect.fromLTWH(0, 0, 400, 70)),
                ),
              ),
              const TextSpan(text: '\nfrom idea to production.'),
            ],
          ),
          style: mobile
              ? AppTextStyles.h2.copyWith(fontSize: 36)
              : AppTextStyles.h1,
          textAlign: textAlign,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: centered ? 500 : double.infinity,
          child: Text(
            'I design and develop web & mobile applications end-to-end — '
            'from architecture to deployment. Clean code, real results.',
            style: AppTextStyles.bodyLarge,
            textAlign: textAlign,
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            GradientButton(
              label: 'View My Work',
              onPressed: onViewWork,
              icon: Icons.arrow_forward_rounded,
            ),
            GradientButton(
              label: 'Contact Me',
              onPressed: onContact,
              isPrimary: false,
              icon: Icons.chat_bubble_outline_rounded,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCodeCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.05),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _dot(const Color(0xFFFF5F57)),
              const SizedBox(width: 8),
              _dot(const Color(0xFFFFBD2E)),
              const SizedBox(width: 8),
              _dot(const Color(0xFF28C840)),
              const Spacer(),
              Text(
                'developer.dart',
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textMuted, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _codeText(),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  Widget _codeText() {
    const keyword = TextStyle(
      fontFamily: 'monospace',
      fontSize: 14,
      height: 1.8,
      color: AppColors.purple,
    );
    const variable = TextStyle(
      fontFamily: 'monospace',
      fontSize: 14,
      height: 1.8,
      color: AppColors.accent,
    );
    const string = TextStyle(
      fontFamily: 'monospace',
      fontSize: 14,
      height: 1.8,
      color: Color(0xFFF59E0B),
    );
    const normal = TextStyle(
      fontFamily: 'monospace',
      fontSize: 14,
      height: 1.8,
      color: AppColors.textSecondary,
    );

    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(text: 'const ', style: keyword),
          TextSpan(text: 'developer', style: variable),
          const TextSpan(text: ' = {\n', style: normal),
          const TextSpan(text: '  name: ', style: normal),
          TextSpan(text: "'Dovlet Aydogdyyev'", style: string),
          const TextSpan(text: ',\n', style: normal),
          const TextSpan(text: '  role: ', style: normal),
          TextSpan(text: "'Full-Stack Engineer'", style: string),
          const TextSpan(text: ',\n', style: normal),
          const TextSpan(text: '  stack: ', style: normal),
          const TextSpan(text: '[', style: normal),
          TextSpan(text: "'Flutter'", style: string),
          const TextSpan(text: ', ', style: normal),
          TextSpan(text: "'Django'", style: string),
          const TextSpan(text: ', ', style: normal),
          TextSpan(text: "'React'", style: string),
          const TextSpan(text: '],\n', style: normal),
          const TextSpan(text: '  passion: ', style: normal),
          TextSpan(text: "'Building products'", style: string),
          const TextSpan(text: ',\n', style: normal),
          const TextSpan(text: '  available: ', style: normal),
          TextSpan(text: 'true', style: keyword),
          const TextSpan(text: ',\n', style: normal),
          const TextSpan(text: '};', style: normal),
        ],
      ),
    );
  }
}
