import 'package:flutter/material.dart';
import 'package:ultimate_stats_app/screens/home/home_screen.dart';

/// Entry point — launches the app.
void main() {
  runApp(const UltimateStatsApp());
}

/// Root widget that configures the app's theme and initial route.
class UltimateStatsApp extends StatelessWidget {
  const UltimateStatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultimate Stats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
