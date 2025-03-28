import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:personal_website/screens/home/widgets/social_icons.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText(
              'Dowlet Aydogdyyew',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SelectableText(
              'Software Engineer',
              style: TextStyle(
                fontFamily: 'Indie Flower',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Spacer(),
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SocialIcons(
                launchUri: Uri.parse('https://github.com/morena96'),
                icon: 'assets/icons/github.svg',
                text: 'morena96',
              ),
              SizedBox(height: 8),
              SocialIcons(
                launchUri: Uri.parse('https://www.linkedin.com/in/dovlet96/'),
                icon: 'assets/icons/linkedin.svg',
                text: 'dovlet96',
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SocialIcons(
                launchUri: Uri.parse('https://www.linkedin.com/in/dovlet96/'),
                onTap: () async {
                  final data = await rootBundle.load('assets/cv.pdf');
                  final bytes = data.buffer.asUint8List();
                  final blob = html.Blob([bytes]);
                  final url = html.Url.createObjectUrlFromBlob(blob);

                  html.AnchorElement(href: url)
                    ..setAttribute('download', 'Dowlet_Aydogdyyew_CV.pdf')
                    ..click();
                  html.Url.revokeObjectUrl(url);
                },
                icon: 'assets/icons/cv.svg',
                text: 'CV',
              ),
              SizedBox(height: 8),
              SocialIcons(
                launchUri: Uri.parse('tel:+99361749266'),
                icon: 'assets/icons/phone.svg',
                text: '+99361749266',
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SocialIcons(
                launchUri: Uri.parse('https://g.co/kgs/AYFLbnT'),
                icon: 'assets/icons/location.svg',
                text: 'Turkmenistan, AG',
              ),
              SizedBox(height: 8),
              SocialIcons(
                launchUri: Uri.parse('mailto:dowlet101@gmail.com'),
                icon: 'assets/icons/email.svg',
                text: 'dowlet101@gmail.com',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
