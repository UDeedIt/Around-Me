// lib/domain/models/place.dart

/// Domain model representing a single place (POI) around the user.
class Place {

  const Place({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.categoryId,
    this.description,
    this.rating,
    this.isOpenNow,
    this.imageUrl,
  });

  /// Unique identifier for the place.
  final String id;

  /// Human-readable name of the place.
  final String name;

  /// Simple address or description.
  final String address;

  /// Latitude in decimal degrees.
  final double latitude;

  /// Longitude in decimal degrees.
  final double longitude;

  /// Identifier of the category this place belongs to (e.g. 'cafes').
  final String categoryId;

  /// Optional short description (e.g. "Cozy café with Wi-Fi").
  final String? description;

  /// Optional rating (e.g. 4.3 out of 5).
  final double? rating;

  /// Optional open/closed flag (true = open, false = closed, null = unknown).
  final bool? isOpenNow;

  final String? imageUrl;
}
