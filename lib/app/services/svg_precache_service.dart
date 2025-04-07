import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_website/data/models/technology.dart';

class SvgPrecacheService {
  static Future<void> precacheSvgs(BuildContext context) async {
    final svgAssets = [
      'assets/icons/github.svg',
      'assets/icons/linkedin.svg',
      'assets/icons/telegram.svg',
      'assets/icons/leetcode.svg',
      'assets/icons/codeforces.svg',
      'assets/icons/cv.svg',
      'assets/icons/phone.svg',
      'assets/icons/location.svg',
      'assets/icons/email.svg',
      // Add all technology icons
      ...programmingLanguages.map((tech) => tech.icon),
      ...frameworks.map((tech) => tech.icon),
      ...operatingSystems.map((tech) => tech.icon),
      ...databases.map((tech) => tech.icon),
      ...tools.map((tech) => tech.icon),
      ...agile.map((tech) => tech.icon),
    ];

    for (final asset in svgAssets) {
      try {
        final loader = SvgAssetLoader(asset);
        svg.cache.putIfAbsent(
          loader.cacheKey(null),
          () => loader.loadBytes(null),
        );
      } catch (e) {
        debugPrint('Failed to precache $asset: $e');
      }
    }
  }
}
