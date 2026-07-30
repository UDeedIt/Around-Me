// lib/features/home/home_screen.dart

import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../l10n/app_localizations.dart';
import '../../data/mock/mock_places_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = MockPlacesData.categories;

    return Scaffold(
      appBar: AppBar(
          title: Text(l10n?.homeTitle ?? AppStrings.homeTitleFallback)
      ),
      // body with grid as before...
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/places',
                  arguments: category,
                );
              },
              child: Card(
                color: category.color.withValues(alpha: 0.1),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: category.color, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category.icon, size: 64, color: category.color),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: category.color),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
