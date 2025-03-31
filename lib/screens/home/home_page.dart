import 'package:flutter/material.dart';
import 'package:personal_website/screens/home/widgets/about_me.dart';
import 'package:personal_website/screens/home/widgets/header_widget.dart';
import 'package:personal_website/screens/home/widgets/technologies_widget.dart';

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
