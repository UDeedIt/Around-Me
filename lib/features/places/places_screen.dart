// lib/features/places/places_screen.dart

import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/localization/localized_strings.dart';
import '../../data/mock/mock_places_data.dart';
import '../../domain/models/place_category.dart';
import '../../l10n/app_localizations.dart';
// import '../../l10n/app_localizations.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key, required this.category, required this.categoryName});
  // const PlacesScreen({super.key, required this.categoryName});

  final PlaceCategory category;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final title = l10n?.placesTitle(category.name)
        ?? AppStrings.placesTitleFallback(category.name);

    final places = MockPlacesData.placesForCategory(category.id);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.separated(
        itemCount: places.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            title: Text(place.name),
            subtitle: Text(place.address),
          );
        },
      ),
    );

    // final l10n = AppLocalizations.of(context);
    // final l10nStrings = context.strings;
    // final mockPlaces = List.generate(10, (index) => '$categoryName Place ${index + 1}',);

    // return Scaffold(
    //   appBar: AppBar(title: Text(l10nStrings.homeTitle)),
    //   body: ListView.separated(
    //     itemCount: mockPlaces.length,
    //     separatorBuilder: (_, index) => const Divider(height: 1),
    //     itemBuilder: (context, index) {
    //       final place = mockPlaces[index];
    //       return ListTile(
    //         title: Text(place),
    //         subtitle: const Text('Mock address • distance TBD'),
    //       );
    //     },
    //   ),
    // );
  }
}
