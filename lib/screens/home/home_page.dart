import 'package:flutter/material.dart';
import 'package:personal_website/screens/home/widgets/about_me.dart';
import 'package:personal_website/screens/home/widgets/header_widget.dart';
import 'package:personal_website/screens/home/widgets/technologies_widget.dart';
import 'package:flutter/services.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'widgets/social_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onThemeToggle});

  final VoidCallback onThemeToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),

            children: [
              HeaderWidget(),
              SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    'assets/images/avatar.jpeg',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Turning ideas into code, code into impact.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tektur',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcons(
                    launchUri: Uri.parse('https://github.com/morena96'),
                    icon: 'assets/icons/github.svg',
                    text: 'morena96',
                  ),
                  SizedBox(width: 4),
                  SocialIcons(
                    launchUri: Uri.parse(
                      'https://www.linkedin.com/in/dovlet96/',
                    ),
                    icon: 'assets/icons/linkedin.svg',
                    text: 'dovlet96',
                    height: 38,
                    width: 38,
                  ),
                  SizedBox(width: 4),
                  SocialIcons(
                    launchUri: Uri.parse('https://telegram.me/dovlet_96'),
                    icon: 'assets/icons/telegram.svg',
                    text: 'dovlet_96',
                    width: 28,
                    height: 28,
                  ),
                  SizedBox(width: 8),
                  SocialIcons(
                    launchUri: Uri.parse('https://leetcode.com/u/dowlet101/'),
                    icon: 'assets/icons/leetcode.svg',
                    text: 'dowlet101',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  SocialIcons(
                    launchUri: Uri.parse('https://codeforces.com/profile/1O1'),
                    icon: 'assets/icons/codeforces.svg',
                    text: '1O1',
                  ),
                  SizedBox(width: 8),
                  SocialIcons(
                    launchUri: Uri.parse('https://'),
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
                  SizedBox(width: 8),
                  SocialIcons(
                    launchUri: Uri.parse('tel:+99361749266'),
                    icon: 'assets/icons/phone.svg',
                    text: '+99361749266',
                    height: 29,
                    width: 29,
                  ),
                  SizedBox(width: 8),
                  SocialIcons(
                    launchUri: Uri.parse('https://g.co/kgs/AYFLbnT'),
                    icon: 'assets/icons/location.svg',
                    text: 'Turkmenistan, AG',
                  ),
                  SizedBox(width: 8),
                  SocialIcons(
                    launchUri: Uri.parse('mailto:dowlet101@gmail.com'),
                    icon: 'assets/icons/email.svg',
                    text: 'dowlet101@gmail.com',
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: AboutMe()),
                  SizedBox(width: 50),
                  SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white54
                              : Colors.black38,
                      thickness: 1,
                      width: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  SizedBox(width: 50),
                  Expanded(child: TechnologiesWidget()),
                ],
              ),
            ],
          ),
          Positioned(
            top: 30,
            right: 30,
            child: IconButton(
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: onThemeToggle,
            ),
          ),
        ],
      ),
    );
  }
}
