import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';
import 'package:personal_website/data/models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: mobile ? 60 : 100),
      child: ContentWrapper(
        maxWidth: 1300,
        child: Column(
          children: [
            Text(
              'SELECTED WORK',
              style: AppTextStyles.overline,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Products I\'ve built and shipped.',
              style: mobile
                  ? AppTextStyles.h2.copyWith(fontSize: 28)
                  : AppTextStyles.h2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 500,
              child: Text(
                'From startups to enterprise — real products solving real problems.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 60),
            if (mobile)
              Column(
                children: projects
                    .map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ProjectCard(project: p),
                        ))
                    .toList(),
              )
            else
              _buildGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: projects.map((p) {
        final w = (MediaQuery.of(context).size.width > 1300
                ? 1300.0
                : MediaQuery.of(context).size.width) -
            contentPadding(context) * 2;
        final cardWidth = (w - 24) / 2;
        return SizedBox(
          width: cardWidth,
          child: _ProjectCard(project: p),
        );
      }).toList(),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: _isHovered
            ? (Matrix4.identity()..translate(0.0, -4.0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? AppColors.accent.withValues(alpha: 0.3)
                : AppColors.border,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: p.gradientColors.last.withValues(alpha: 0.15),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: p.gradientColors,
              ),
            ),
            child: Stack(
              children: [
                // Abstract icon background
                Positioned(
                  top: -20,
                  right: -20,
                  child: Icon(
                    p.icon,
                    size: 180,
                    color: Colors.white.withValues(alpha: 0.04),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          p.role,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.accent,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Icon(p.icon, color: AppColors.accent, size: 40),
                      const SizedBox(height: 16),
                      Text(
                        p.title,
                        style: AppTextStyles.h3,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        p.description,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textSecondary.withValues(alpha: 0.9),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: p.tech
                            .map((t) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.08),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.08),
                                    ),
                                  ),
                                  child: Text(
                                    t,
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.textSecondary,
                                      fontSize: 12,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                // Hover arrow
                Positioned(
                  top: 28,
                  right: 28,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isHovered ? 1 : 0.3,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.north_east_rounded,
                        color: AppColors.textPrimary,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
