import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = [
    'Cafés',
    'Restaurants',
    'Sights',
    'Parks',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(l10n?.homeTitle ?? AppStrings.homeTitleFallback)
      ),
      // body with grid as before...
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: _categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final category = _categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/places',
                  arguments: category,
                );
              },
              child: Card(
                child: Center(
                  child: Text(
                    category,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
