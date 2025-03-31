import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final Uri launchUri;
  final String icon;
  final String text;
  final VoidCallback? onTap;

  const SocialIcons({
    super.key,
    required this.launchUri,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onTap ?? () async => await launchUrl(launchUri),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 32,
            width: 32,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontSize: 16,
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
