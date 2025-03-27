import 'package:flutter/material.dart';
import 'widgets/social_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        children: [
          Row(
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
                    style: TextStyle(fontFamily: 'Indie Flower', fontSize: 28),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SocialIcons(
                    launchUri: Uri.parse(
                      'https://www.linkedin.com/in/dovlet96/',
                    ),
                    icon: 'assets/icons/linkedin.svg',
                    text: 'dovlet96',
                  ),
                  SizedBox(height: 8),
                  SocialIcons(
                    launchUri: Uri.parse('https://github.com/morena96'),
                    icon: 'assets/icons/github.svg',
                    text: 'morena96',
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SocialIcons(
                    launchUri: Uri.parse('mailto:dowlet101@gmail.com'),
                    icon: 'assets/icons/email.svg',
                    text: 'dowlet101@gmail.com',
                  ),

                  SizedBox(height: 8),
                  SocialIcons(
                    launchUri: Uri.parse('tel:+99361749266'),
                    icon: 'assets/icons/phone.svg',
                    text: '+99361749266',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
