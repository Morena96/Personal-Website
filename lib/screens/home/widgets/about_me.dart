import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'About Me',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Indie Flower',
          ),
        ),
        SelectableText(
          'I am a passionate Software Engineer with a strong background in '
          'full-stack development, specializing in Flutter, Python, and '
          'JavaScript. I have experience in building scalable, high-performance '
          'applications, focusing on creating seamless user experiences.\n'
          'I am always eager to learn and explore new technologies, '
          'staying up-to-date with the latest trends in software development '
          'to build innovative solutions.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Space Grotesk',
          ),
        ),
      ],
    );
  }
}
