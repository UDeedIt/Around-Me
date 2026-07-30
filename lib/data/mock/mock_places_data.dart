// lib/data/mock/mock_places_data.dart

import 'package:flutter/material.dart';
import '../../domain/models/place_category.dart';
import '../../domain/models/place.dart';

/// In-memory mock data for categories and places.
///
/// This will later be replaced by a repository backed by real APIs.
class MockPlacesData {

  /// Static list of available categories.
// lib/data/mock/mock_places_data.dart

  static const categories = <PlaceCategory>[
    PlaceCategory(
      id: 'transport',
      name: 'Transport',
      icon: Icons.directions_transit,
      color: Colors.indigo,
    ),
    PlaceCategory(
      id: 'food_drink',
      name: 'Food & Drink',
      icon: Icons.restaurant,
      color: Colors.deepOrange,
    ),
    PlaceCategory(
      id: 'coffee',
      name: 'Cafés',
      icon: Icons.local_cafe,
      color: Colors.brown,
    ),
    PlaceCategory(
      id: 'nightlife',
      name: 'Nightlife',
      icon: Icons.nightlife,
      color: Colors.purple,
    ),
    PlaceCategory(
      id: 'banking',
      name: 'Banking & Finance',
      icon: Icons.account_balance,
      color: Colors.teal,
    ),
    PlaceCategory(
      id: 'education',
      name: 'Education',
      icon: Icons.school,
      color: Colors.blue,
    ),
    PlaceCategory(
      id: 'health',
      name: 'Health',
      icon: Icons.local_hospital,
      color: Colors.red,
    ),
    PlaceCategory(
      id: 'beauty',
      name: 'Beauty & Wellness',
      icon: Icons.spa,
      color: Colors.pink,
    ),
    PlaceCategory(
      id: 'entertainment',
      name: 'Entertainment',
      icon: Icons.movie,
      color: Colors.blueGrey,
    ),
    PlaceCategory(
      id: 'attractions',
      name: 'Attractions',
      icon: Icons.camera_alt,
      color: Colors.green,
    ),
    PlaceCategory(
      id: 'worship',
      name: 'Religion & Worship',
      icon: Icons.church,
      color: Colors.deepPurple,
    ),
    PlaceCategory(
      id: 'stay_rent',
      name: 'Stay & Rental',
      icon: Icons.hotel,
      color: Colors.lightBlue,
    ),
  ];


  /// Static list of mock places.
  static const places = <Place>[
    // Transport
    Place(
      id: 'transport_airport_1',
      name: 'City Airport',
      address: 'Airport Road 1',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'transport',
    ),
    Place(
      id: 'transport_bus_1',
      name: 'Central Bus Station',
      address: 'Bus Station Square',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'transport',
    ),
    Place(
      id: 'transport_train_1',
      name: 'Main Railway Station',
      address: 'Railway Street 3',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'transport',
    ),

    // Food & Drink
    Place(
      id: 'food_cafe_1',
      name: 'Central Café',
      address: 'Coffee Street 1',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'food_drink',
    ),
    Place(
      id: 'food_restaurant_1',
      name: 'Downtown Restaurant',
      address: 'Market Street 5',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'food_drink',
    ),
    Place(
      id: 'food_bar_1',
      name: 'Old Town Bar',
      address: 'Nightlife Avenue',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'food_drink',
    ),

    // Banking & Finance
    Place(
      id: 'bank_1',
      name: 'City Bank',
      address: 'Finance Street 2',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'banking',
    ),
    Place(
      id: 'atm_1',
      name: 'Central ATM',
      address: 'Mall Entrance',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'banking',
    ),

    // Education
    Place(
      id: 'school_1',
      name: 'Central School',
      address: 'School Road 10',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'education',
    ),
    Place(
      id: 'university_1',
      name: 'City University',
      address: 'Campus Avenue 1',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'education',
    ),
    Place(
      id: 'library_1',
      name: 'City Library',
      address: 'Library Street',
      latitude: 0.0,
      longitude: 0.0,
      categoryId: 'education',
    ),

    // Health & Beauty, Entertainment, Attractions, Worship, Accommodation...
    // (Add 2–3 items per category in the same style.)
  ];


  /// Returns all places for a given category id.
  static List<Place> placesForCategory(String categoryId) {
    return places.where((p) => p.categoryId == categoryId).toList();
  }
}
