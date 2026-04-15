import 'package:flutter/material.dart';
import 'package:personal_website/core/theme.dart';
import 'package:personal_website/screens/home/sections/hero_section.dart';
import 'package:personal_website/screens/home/sections/trust_section.dart';
import 'package:personal_website/screens/home/sections/projects_section.dart';
import 'package:personal_website/screens/home/sections/process_section.dart';
import 'package:personal_website/screens/home/sections/about_section.dart';
import 'package:personal_website/screens/home/sections/contact_section.dart';
import 'package:personal_website/widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  // Keys for each section to enable smooth scrolling
  final _heroKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _processKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = _scrollController.offset > 50;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  void _scrollToSection(int index) {
    final keys = [_heroKey, _projectsKey, _processKey, _aboutKey, _contactKey];
    if (index < keys.length) {
      final ctx = keys[index].currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background ambient orbs
          Positioned(
            top: 800,
            left: -200,
            child: GradientOrb(
              size: 600,
              color: AppColors.purple,
              opacity: 0.04,
            ),
          ),
          Positioned(
            top: 2400,
            right: -200,
            child: GradientOrb(
              size: 500,
              color: AppColors.accent,
              opacity: 0.04,
            ),
          ),

          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  key: _heroKey,
                  onViewWork: () => _scrollToSection(1),
                  onContact: () => _scrollToSection(4),
                ),
                const TrustSection(),
                ProjectsSection(key: _projectsKey),
                ProcessSection(key: _processKey),
                AboutSection(key: _aboutKey),
                ContactSection(key: _contactKey),
                const Footer(),
              ],
            ),
          ),

          // Fixed navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onNavTap: _scrollToSection,
              isScrolled: _isScrolled,
            ),
          ),

          // Scroll to top button
          Positioned(
            bottom: 30,
            right: 30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isScrolled ? 1 : 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutCubic,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: AppColors.accent,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
