import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';

class TrustSection extends StatelessWidget {
  const TrustSection({super.key});

  static const _items = [
    _TrustItem(
      icon: Icons.layers_rounded,
      title: 'End-to-End Development',
      description: 'From frontend interfaces to backend APIs and databases — I handle the full stack.',
    ),
    _TrustItem(
      icon: Icons.architecture_rounded,
      title: 'Scalable Architecture',
      description: 'Clean architecture patterns that scale with your business, not against it.',
    ),
    _TrustItem(
      icon: Icons.code_rounded,
      title: 'Clean, Maintainable Code',
      description: 'SOLID principles, proper testing, and documentation. Code that your next developer will thank you for.',
    ),
    _TrustItem(
      icon: Icons.rocket_launch_rounded,
      title: 'Proven Delivery',
      description: 'Real products used by thousands. From #1 app launches to enterprise platforms.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        vertical: mobile ? 60 : 100,
      ),
      child: ContentWrapper(
        child: Column(
          children: [
            Text(
              'WHY WORK WITH ME',
              style: AppTextStyles.overline,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'I deliver results, not just code.',
              style: mobile
                  ? AppTextStyles.h2.copyWith(fontSize: 28)
                  : AppTextStyles.h2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            if (mobile)
              Column(
                children: _items
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _TrustCard(item: item),
                        ))
                    .toList(),
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _items
                    .map((item) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: _TrustCard(item: item),
                          ),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class _TrustItem {
  final IconData icon;
  final String title;
  final String description;

  const _TrustItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _TrustCard extends StatefulWidget {
  final _TrustItem item;

  const _TrustCard({required this.item});

  @override
  State<_TrustCard> createState() => _TrustCardState();
}

class _TrustCardState extends State<_TrustCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.surfaceLight : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.accent.withValues(alpha: 0.3) : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.accent.withValues(alpha: 0.15)
                    : AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.item.icon,
                color: AppColors.accent,
                size: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.item.title,
              style: AppTextStyles.h3.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              widget.item.description,
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}
