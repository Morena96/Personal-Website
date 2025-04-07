import 'package:flutter/material.dart';
import 'package:personal_website/screens/home/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:personal_website/app/services/svg_precache_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isDark});

  final bool? isDark;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode =
        widget.isDark == true
            ? ThemeMode.dark
            : widget.isDark == false
            ? ThemeMode.light
            : ThemeMode.system;

    // Precache SVGs
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SvgPrecacheService.precacheSvgs(context);
    });
  }

  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.system) {
        final platformBrightness = MediaQuery.platformBrightnessOf(context);
        _themeMode =
            platformBrightness == Brightness.dark
                ? ThemeMode.light
                : ThemeMode.dark;
      } else {
        _themeMode =
            _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      }
    });

    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isDark', _themeMode == ThemeMode.dark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(onThemeToggle: toggleTheme),
      title: 'Software Engineer | Dovlet',
      themeMode: _themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black12,
        textTheme: const TextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
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
            background: Container(
              color:
                  _themeMode == ThemeMode.dark
                      ? Colors.black
                      : _themeMode == ThemeMode.light
                      ? const Color(0xFFF5F5F5)
                      : MediaQuery.platformBrightnessOf(context) ==
                          Brightness.dark
                      ? Colors.black
                      : const Color(0xFFF5F5F5),
            ),
          ),
    );
  }
}
