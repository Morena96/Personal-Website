import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final Uri launchUri;
  final String icon;
  final String text;

  const SocialIcons({
    super.key,
    required this.launchUri,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () async => await launchUrl(launchUri),
      child: Row(
        children: [
          SvgPicture.asset(icon, height: 32, width: 32),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
