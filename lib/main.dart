// lib/main.dart

import 'package:flutter/material.dart';
import 'features/splash/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/places/places_screen.dart';

void main() {
  runApp(const AroundMeApp());
}

class AroundMeApp extends StatelessWidget {
  const AroundMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Around Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
        '/places': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as String? ?? '';
          return PlacesScreen(categoryName: args);
        },
      },
    );
  }
}
