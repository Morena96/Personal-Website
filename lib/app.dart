import 'package:flutter/material.dart';
import 'package:personal_website/home/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme.of(
          context,
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      builder:
          (context, child) => ResponsiveWrapper.builder(
            child,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.autoScaleDown(1440, name: 'DesktopMini'),
              ResponsiveBreakpoint.resize(1440, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1800, name: 'DesktopMax'),
            ],
            background: Container(color: const Color(0xFFF5F5F5)),
          ),
    );
  }
}
