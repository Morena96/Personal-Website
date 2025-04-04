import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final Uri launchUri;
  final String icon;
  final String text;
  final VoidCallback? onTap;
  final double height;
  final double width;

  const SocialIcons({
    super.key,
    this.height = 32,
    this.width = 32,
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
      child: Tooltip(
        message: text,
        preferBelow: false,
        child: SvgPicture.asset(
          icon,
          height: height,
          width: width,
          colorFilter: ColorFilter.mode(
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
