import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F1FA), // Lavender White
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF34304D), // Deep Plum
          primary: const Color(0xFF34304D), // Deep Plum[cite: 1]
          secondary: const Color(0xFF8B78C6), // Purple[cite: 1]
          tertiary: const Color(0xFFE5A6A6), // Dusty Pink[cite: 1]
          primaryContainer: const Color(0xFFC5B8E8), // Soft Lavender[cite: 1]
          surface: const Color(0xFFF4F1FA), // Lavender White[cite: 1]
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}