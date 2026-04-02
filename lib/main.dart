import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const UltimateStatsApp());
}

class UltimateStatsApp extends StatelessWidget {
  const UltimateStatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultimate Stats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
