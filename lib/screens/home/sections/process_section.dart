import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  static const _steps = [
    _ProcessStep(
      number: '01',
      title: 'Discover & Plan',
      description:
          'I start by understanding your goals, users, and constraints. '
          'Then I map out the architecture, choose the right stack, and plan milestones.',
      icon: Icons.lightbulb_outline_rounded,
    ),
    _ProcessStep(
      number: '02',
      title: 'Build & Iterate',
      description:
          'I develop in focused sprints, shipping working features fast. '
          'Regular check-ins ensure we\'re always aligned and moving forward.',
      icon: Icons.build_circle_outlined,
    ),
    _ProcessStep(
      number: '03',
      title: 'Launch & Scale',
      description:
          'Deployment, monitoring, and optimization. I make sure your product '
          'is production-ready, performant, and built to grow.',
      icon: Icons.trending_up_rounded,
    ),
  ];

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
              'HOW I WORK',
              style: AppTextStyles.overline,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'A clear process, every time.',
              style: mobile
                  ? AppTextStyles.h2.copyWith(fontSize: 28)
                  : AppTextStyles.h2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            if (mobile)
              Column(
                children: _steps
                    .map((step) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ProcessCard(step: step),
                        ))
                    .toList(),
              )
            else
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < _steps.length; i++) ...[
                      Expanded(child: _ProcessCard(step: _steps[i])),
                      if (i < _steps.length - 1) ...[
                        const SizedBox(width: 12),
                        _buildConnector(),
                        const SizedBox(width: 12),
                      ],
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnector() {
    return Center(
      child: Container(
        width: 40,
        height: 2,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.accent, AppColors.purple],
          ),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}

class _ProcessStep {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class _ProcessCard extends StatefulWidget {
  final _ProcessStep step;

  const _ProcessCard({required this.step});

  @override
  State<_ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<_ProcessCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.surfaceLight : AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                _isHovered ? AppColors.accent.withValues(alpha: 0.3) : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  widget.step.number,
                  style: AppTextStyles.h1.copyWith(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                  ),
                  colors: const [AppColors.accent, AppColors.purple],
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? AppColors.accent.withValues(alpha: 0.15)
                        : AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    widget.step.icon,
                    color: AppColors.accent,
                    size: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.step.title,
              style: AppTextStyles.h3.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              widget.step.description,
              style: AppTextStyles.body,
            ),
          ],
        ),
      ),
    );
  }
}
