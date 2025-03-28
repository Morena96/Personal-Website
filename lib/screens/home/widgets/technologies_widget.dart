import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_website/data/models/technology.dart';

class TechnologiesWidget extends StatelessWidget {
  const TechnologiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Programming Languages',
          style: TextStyle(
            fontFamily: 'Indie Flower',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Row(
          children: [
            ...programmingLanguages.map(
              (e) => Padding(
                padding: EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  e.icon,
                  height: 40,
                  width: 40,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
