// lib/features/places/places_screen.dart

import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../domain/models/place_category.dart';
import '../../data/mock/mock_places_data.dart';
import '../../l10n/app_localizations.dart';

/// Screen that shows a list of places for a given [PlaceCategory].
///
/// In v1 this screen is backed entirely by mock data via [MockPlacesData].
/// Later, this will be replaced by a ViewModel + repository/use case.
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({
    super.key,
    required this.category,
  });

  /// Category for which we are showing places (e.g. Food & Drink, Transport).
  final PlaceCategory category;

  @override
  Widget build(BuildContext context) {
    // Localizations for this context (may be null very early in app startup).
    final l10n = AppLocalizations.of(context);

    // Localized title for the app bar; if localization is not ready,
    // fall back to a simple, non-localized formatting.
    final title = l10n?.placesTitle(category.name) ??
        AppStrings.placesTitleFallback(category.name);

    // Get a mock list of places for this category from the in-memory data.
    final places = MockPlacesData.placesForCategory(category.id);

    return Scaffold(
      appBar: AppBar(
        // Use the category color as background for visual theming.
        backgroundColor: category.color,
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: places.length,
        // Simple separators between list items.
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final place = places[index];

          return ListTile(
            // Main text: place name (e.g. "Central Café").
            title: Text(place.name),
            // Secondary text: mock address/description.
            subtitle: Text(place.address),
            // Optional: you could use leading/trailing icons, etc.
          );
        },
      ),
    );
  }
}
