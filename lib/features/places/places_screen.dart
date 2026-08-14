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

          // Wrap the entire item in padding for better touch target and spacing
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              children: [
                // Clipped image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: place.imageUrl != null
                      ? Image.network(
                    place.imageUrl!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    // Fallback widget if image fails to load
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported),
                    ),
                  )
                      : Image.asset(
                    'assets/images/placeholder_car_rental.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                // Textual information column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Place name
                      Text(
                        place.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 2),
                      // Place description
                      Text(
                        place.description ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      // Place address (with subdued text color)
                      Text(
                        place.address,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Status and rating row
                      Row(
                        children: [
                          // Open/Closed indicator icon
                          Icon(
                            (place.isOpenNow ?? false) ? Icons.check_circle : Icons.cancel,
                            color:(place.isOpenNow ?? false) ? Colors.green : Colors.red,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          // Open/Closed text
                          Text(
                            (place.isOpenNow ?? false) ? 'Open' : 'Closed',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:(place.isOpenNow ?? false) ? Colors.green : Colors.red,
                            ),
                          ),
                          const Spacer(),
                          // Rating stars and value
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 2),
                              Text(
                                (place.rating ?? 0.0).toStringAsFixed(1),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
