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
}
