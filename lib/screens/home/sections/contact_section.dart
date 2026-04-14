import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(vertical: mobile ? 60 : 100),
      child: ContentWrapper(
        child: Column(
          children: [
            Text(
              'GET IN TOUCH',
              style: AppTextStyles.overline,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            GradientText(
              'Let\'s build something great.',
              style: mobile
                  ? AppTextStyles.h2.copyWith(fontSize: 28)
                  : AppTextStyles.h2,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 500,
              child: Text(
                'Have a project in mind? I\'m always open to discussing new opportunities '
                'and interesting challenges.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            _ContactButton(
              icon: Icons.email_outlined,
              label: 'dowlet101@gmail.com',
              uri: Uri.parse('mailto:dowlet101@gmail.com'),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _SocialButton(
                  icon: Icons.code_rounded,
                  label: 'GitHub',
                  uri: Uri.parse('https://github.com/morena96'),
                ),
                _SocialButton(
                  icon: Icons.link_rounded,
                  label: 'LinkedIn',
                  uri: Uri.parse('https://www.linkedin.com/in/dovlet96/'),
                ),
                _SocialButton(
                  icon: Icons.send_rounded,
                  label: 'Telegram',
                  uri: Uri.parse('https://telegram.me/dovlet_96'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Uri uri;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.uri,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(widget.uri),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? const LinearGradient(
                    colors: [AppColors.accent, AppColors.accentDark],
                  )
                : null,
            color: _isHovered ? null : AppColors.background,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _isHovered ? Colors.transparent : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: _isHovered ? AppColors.background : AppColors.accent,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: AppTextStyles.body.copyWith(
                  color: _isHovered
                      ? AppColors.background
                      : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Uri uri;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.uri,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(widget.uri),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.surfaceLight : AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered
                  ? AppColors.accent.withValues(alpha: 0.3)
                  : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: _isHovered ? AppColors.accent : AppColors.textSecondary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: AppTextStyles.caption.copyWith(
                  color: _isHovered
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: ContentWrapper(
        child: Column(
          children: [
            Container(
              height: 1,
              color: AppColors.border,
            ),
            const SizedBox(height: 32),
            if (mobile)
              Column(
                children: [
                  Text(
                    '© 2026 Dovlet Aydogdyyev',
                    style: AppTextStyles.caption,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Built with Flutter',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2026 Dovlet Aydogdyyev. All rights reserved.',
                    style: AppTextStyles.caption,
                  ),
                  Text(
                    'Built with Flutter',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
