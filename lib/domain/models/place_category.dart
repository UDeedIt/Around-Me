// lib/domain/models/place_category.dart

import 'package:flutter/material.dart';

/// Domain model representing a category of places (e.g. Cafés, Restaurants).
class PlaceCategory {
  const PlaceCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  /// Unique identifier for the category (e.g. 'cafes', 'restaurants').
  final String id;

  /// Display name for the category.
  final String name;

  /// Icon to represent the category in the UI.
  final IconData icon;

  /// Themed color for this category (used in tiles, app bars, etc.).
  final Color color;
}