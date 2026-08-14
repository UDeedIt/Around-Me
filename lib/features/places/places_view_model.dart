// lib/features/places/places_view_model.dart

import 'package:flutter/foundation.dart';
import '../../domain/models/place.dart';
import '../../domain/models/place_category.dart';
import '../../data/mock/mock_places_data.dart';

/// ViewModel for the places list screen.
///
/// In v1 it uses mock data; later it will call a repository/use case.
class PlacesViewModel extends ChangeNotifier {
  PlacesViewModel(this.category) {
    _loadPlaces();
  }

  /// Category for which we are showing places.
  final PlaceCategory category;

  /// Current list of places for [category].
  List<Place> _places = [];
  List<Place> get places => _places;

  /// Whether data is currently loading.
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _loadPlaces() {
    _isLoading = true;
    notifyListeners();

    // For v1, this is synchronous mock data.
    _places = MockPlacesData.placesForCategory(category.id);

    _isLoading = false;
    notifyListeners();
  }
}
