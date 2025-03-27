import 'package:flutter/material.dart';
import 'package:personal_website/home/widgets/about_me.dart';
import 'package:personal_website/home/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        children: [
          HeaderWidget(),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(child: AboutMe()),
              SizedBox(width: 30),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
