// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/app_strings.dart';
import 'domain/models/place_category.dart';
import 'l10n/app_localizations.dart';
import 'features/splash/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/places/places_screen.dart';

/// Root entry point for the Around Me app.
///
/// This sets up:
/// - Global theme (Material 3, seed color)
/// - Named routes: `/splash`, `/home`, `/places`
/// - Initial route: `/splash`
void main() {
  runApp(const AroundMeApp());
}

/// Top-level widget for the Around Me application.
class AroundMeApp extends StatelessWidget {
  const AroundMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Use localized app title if available, otherwise fall back.
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? AppStrings.appTitleFallback,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
        '/places': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as PlaceCategory;
          return PlacesScreen(category: args, categoryName: '',);
        },
        // '/places': (context) {
        //   final args =
        //       ModalRoute.of(context)!.settings.arguments as String? ?? '';
        //   return PlacesScreen(categoryName: args);
        // },
      },
      // Localization setup.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
        Locale('ru'),
        // add more: Locale('hy'), etc.
      ],
    );
  }
}
