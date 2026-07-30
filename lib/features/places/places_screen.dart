// lib/features/places/places_screen.dart

import 'package:flutter/material.dart';
import '../../core/localization/localized_strings.dart';
// import '../../l10n/app_localizations.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context);
    final l10nStrings = context.strings;

    final mockPlaces = List.generate(10, (index) => '$categoryName Place ${index + 1}',);

    return Scaffold(
      appBar: AppBar(title: Text(l10nStrings.homeTitle)),
      body: ListView.separated(
        itemCount: mockPlaces.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final place = mockPlaces[index];
          return ListTile(
            title: Text(place),
            subtitle: const Text('Mock address • distance TBD'),
          );
        },
      ),
    );
  }
}
