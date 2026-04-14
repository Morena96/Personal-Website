import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final String role;
  final List<String> tech;
  final List<Color> gradientColors;
  final IconData icon;
  final String? url;

  const Project({
    required this.title,
    required this.description,
    required this.role,
    required this.tech,
    required this.gradientColors,
    required this.icon,
    this.url,
  });
}

const projects = [
  Project(
    title: 'Garagum',
    description:
        'A full-stack platform enabling businesses and customers to design custom products with drag-and-drop tools, AI-powered logo processing, and integrated ordering system.',
    role: 'Solo Developer & Designer',
    tech: ['Flutter', 'Django', 'Firebase', 'Docker'],
    gradientColors: [Color(0xFF1A1A2E), Color(0xFF4338CA)],
    icon: Icons.design_services_rounded,
  ),
  Project(
    title: 'Food Delivery Platform',
    description:
        'Led development of the country\'s #1 food delivery app, serving thousands of daily orders with real-time tracking, multi-role management, and 4.5+ star rating.',
    role: 'Engineering Manager',
    tech: ['Flutter', 'Python', 'Firebase', 'REST API'],
    gradientColors: [Color(0xFF1A1A2E), Color(0xFF065F46)],
    icon: Icons.delivery_dining_rounded,
  ),
  Project(
    title: 'Enterprise HRM Suite',
    description:
        'Built comprehensive HR management platform with employee lifecycle tracking, leave management, and performance reviews. Reduced server overhead by 25%.',
    role: 'Full-Stack Engineer',
    tech: ['Flutter', 'Firebase', 'Cloud Functions'],
    gradientColors: [Color(0xFF1A1A2E), Color(0xFF1E40AF)],
    icon: Icons.groups_rounded,
  ),
  Project(
    title: 'Cross-Platform App Suite',
    description:
        'Developed and maintained 5+ major cross-platform applications achieving 95%+ user satisfaction across iOS, Android, and Web platforms.',
    role: 'Full-Stack Engineer',
    tech: ['Flutter', 'Dart', 'Firebase', 'CI/CD'],
    gradientColors: [Color(0xFF1A1A2E), Color(0xFF7C2D12)],
    icon: Icons.devices_rounded,
  ),
];
