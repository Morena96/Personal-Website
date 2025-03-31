import 'package:flutter/material.dart';
import 'package:personal_website/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark');
  runApp(MyApp(isDark: isDark));
}
