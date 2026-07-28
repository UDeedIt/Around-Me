// lib/features/places/places_screen.dart

import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final mockPlaces = List.generate(
      10,
          (index) => '$categoryName Place ${index + 1}',
    );

    return Scaffold(
      appBar: AppBar(title: Text('$categoryName around me')),
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
