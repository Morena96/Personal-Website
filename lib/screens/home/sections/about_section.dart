import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);
    final mobile = isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: mobile ? 60 : 100),
      child: ContentWrapper(
        child: desktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildPhoto(context)),
                  const SizedBox(width: 80),
                  Expanded(flex: 2, child: _buildText(context)),
                ],
              )
            : Column(
                children: [
                  _buildPhoto(context, centered: true),
                  const SizedBox(height: 40),
                  _buildText(context, centered: !desktop),
                ],
              ),
      ),
    );
  }

  Widget _buildPhoto(BuildContext context, {bool centered = false}) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: 0.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              'assets/images/avatar.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildStatRow('6+', 'Years Experience'),
        const SizedBox(height: 8),
        _buildStatRow('10+', 'Products Shipped'),
        const SizedBox(height: 8),
        _buildStatRow('95%+', 'User Satisfaction'),
      ],
    );
  }

  Widget _buildStatRow(String value, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GradientText(
          value,
          style: AppTextStyles.h3.copyWith(fontSize: 20),
        ),
        const SizedBox(width: 10),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildText(BuildContext context, {bool centered = false}) {
    final align =
        centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.left;

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          'ABOUT ME',
          style: AppTextStyles.overline,
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        Text(
          'Engineer who builds and delivers.',
          style: isMobile(context)
              ? AppTextStyles.h2.copyWith(fontSize: 28)
              : AppTextStyles.h2,
          textAlign: textAlign,
        ),
        const SizedBox(height: 24),
        Text(
          'I\'m a Full-Stack Software Engineer with over 6 years of experience '
          'building web and mobile applications. I\'ve worked across the entire '
          'product lifecycle — from early-stage startups to scaling enterprise '
          'platforms.',
          style: AppTextStyles.bodyLarge,
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        Text(
          'As an Engineering Manager, I led a team of 7 to launch the #1 food '
          'delivery app in Turkmenistan. As a solo developer, I\'ve built '
          'everything from custom product design platforms to enterprise HR systems.',
          style: AppTextStyles.bodyLarge,
          textAlign: textAlign,
        ),
        const SizedBox(height: 16),
        Text(
          'I care about clean architecture, user experience, and shipping '
          'products that actually make a difference.',
          style: AppTextStyles.bodyLarge,
          textAlign: textAlign,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            _SkillChip('Flutter'),
            _SkillChip('Django'),
            _SkillChip('React'),
            _SkillChip('Python'),
            _SkillChip('Go'),
            _SkillChip('Firebase'),
            _SkillChip('Docker'),
            _SkillChip('AWS'),
            _SkillChip('PostgreSQL'),
            _SkillChip('CI/CD'),
          ],
        ),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;

  const _SkillChip(this.label);

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.accent.withValues(alpha: 0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered ? AppColors.accent.withValues(alpha: 0.3) : AppColors.border,
          ),
        ),
        child: Text(
          widget.label,
          style: AppTextStyles.caption.copyWith(
            color: _isHovered ? AppColors.accent : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
