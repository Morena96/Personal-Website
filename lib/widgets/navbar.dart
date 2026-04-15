import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';

class Navbar extends StatefulWidget {
  final Function(int) onNavTap;
  final bool isScrolled;

  const Navbar({
    super.key,
    required this.onNavTap,
    this.isScrolled = false,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int? _hoveredIndex;

  static const _navItems = ['Home', 'Work', 'Process', 'About', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: widget.isScrolled
              ? AppColors.background.withValues(alpha: 0.85)
              : Colors.transparent,
          child: ContentWrapper(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => widget.onNavTap(0),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppColors.accent, AppColors.purple],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'D',
                                style: TextStyle(
                                  fontFamily: 'Space Grotesk',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.background,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'dovlet.dev',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!mobile)
                    Row(
                      children: List.generate(_navItems.length, (index) {
                        final isHovered = _hoveredIndex == index;
                        return Padding(
                          padding: const EdgeInsets.only(left: 36),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (_) =>
                                setState(() => _hoveredIndex = index),
                            onExit: (_) =>
                                setState(() => _hoveredIndex = null),
                            child: GestureDetector(
                              onTap: () => widget.onNavTap(index),
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: AppTextStyles.navLink.copyWith(
                                  color: isHovered
                                      ? AppColors.accent
                                      : AppColors.textSecondary,
                                ),
                                child: Text(_navItems[index]),
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  else
                    _MobileMenuButton(onNavTap: widget.onNavTap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatefulWidget {
  final Function(int) onNavTap;

  const _MobileMenuButton({required this.onNavTap});

  @override
  State<_MobileMenuButton> createState() => _MobileMenuButtonState();
}

class _MobileMenuButtonState extends State<_MobileMenuButton> {
  bool _isOpen = false;
  static const _navItems = ['Home', 'Work', 'Process', 'About', 'Contact'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () => setState(() => _isOpen = !_isOpen),
          icon: Icon(
            _isOpen ? Icons.close : Icons.menu,
            color: AppColors.textPrimary,
          ),
        ),
        if (_isOpen)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(_navItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _isOpen = false);
                    widget.onNavTap(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      _navItems[index],
                      style: AppTextStyles.navLink,
                    ),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}
