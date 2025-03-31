import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_website/data/models/technology.dart';

class TechnologiesWidget extends StatelessWidget {
  const TechnologiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: allTechnologies.map((e) => toElement(e, context)).toList(),
    );
  }
}

Widget toElement(Technologies technologies, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SelectableText(
        technologies.title,
        style: TextStyle(
          fontFamily: 'Indie Flower',
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4),
      Row(
        children: [
          ...technologies.technology.map(
            (e) => Padding(
              padding: EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                e.icon,
                height: 30,
                width: 30,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 6),
    ],
  );
}
