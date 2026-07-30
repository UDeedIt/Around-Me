# Around Me Architecture

This document describes the high-level architecture of the Around Me Flutter app.

---

## Goals

- Demonstrate clean, layered architecture in Flutter
- Showcase state management with provider
- Separate presentation, domain, and data concerns
- Make it easy to extend (e.g. real APIs, maps, favorites, offline caching)

---

## High-Level Layers

Around Me follows a clean-ish MVVM style with three main layers:

1. Presentation layer (per feature)
   - Flutter UI (widgets / screens)
   - ViewModels / ChangeNotifiers holding UI state
   - Navigation between screens

2. Domain layer
   - Core models (e.g. Place, PlaceCategory)
   - Use cases (e.g. GetPlacesAroundMe, GetCategories)
   - Abstract repository interfaces (e.g. PlacesRepository)

3. Data layer
   - DTOs and mapping between API and domain models
   - Remote data sources (e.g. PlacesApi using dio)
   - Concrete repository implementations (e.g. PlacesRepositoryImpl)

---

## Project Structure

At a high level, the lib/ directory is organized as follows:

- lib/main.dart
  - Entry point; sets up MaterialApp, routes, theme, and localization.

- lib/features/
  - features/splash/ – Splash screen (initial branding / loading)
  - features/home/ – Home screen with a grid of categories (e.g. Cafés, Restaurants, Sights, Parks)
  - features/places/ – Places list for a selected category
  - (Later) feature-specific ViewModels, widgets, and logic

- lib/domain/
  - models/ – Place, PlaceCategory, and other core entities
  - repositories/ – Abstract repository interfaces (e.g. PlacesRepository)
  - usecases/ – Use case classes (e.g. GetPlacesAroundMe)

- lib/data/
  - datasources/remote/ – API clients (e.g. PlacesApi using dio)
  - dto/ – Data Transfer Objects mapped from/to domain models
  - repositories/ – Repository implementations (e.g. PlacesRepositoryImpl)

- lib/l10n/
  - ARB files for localization (app_en.arb, app_de.arb, app_ru.arb, etc.)
  - Generated app_localizations.dart

- lib/core/
  - constants/ – e.g. AppStrings (fallbacks, non-localized technical strings)
  - (Later) common widgets, helpers, error handling, logging utilities

---

## Presentation Layer (v1)

### Splash Screen

- Path: lib/features/splash/splash_screen.dart
- Responsibilities:
  - Show app icon/title (localized)
  - After a short delay, navigate to the Home screen

### Home Screen

- Path: lib/features/home/home_screen.dart
- Responsibilities:
  - Show app bar with localized title
  - Display a grid of category tiles (e.g. Cafés, Restaurants, Sights, Parks)
  - On tap, navigate to the Places screen for the selected category

### Places Screen

- Path: lib/features/places/places_screen.dart
- Responsibilities (v1):
  - Show app bar with localized title including category name
  - Display a mock list of places for the category
  - Later: integrate real data (e.g. Google Places API) and show distance from user

In v1, the presentation layer uses static/mock data. Later it will depend on the
domain layer (use cases) to obtain real places around the user.

---

## Domain Layer (planned)

The domain layer encapsulates the business logic and is independent of Flutter
widgets or concrete data sources. It will include:

- Models:
  - Place – id, name, coordinates, address, category, rating, etc.
  - PlaceCategory – id, name, icon, etc.

- Repositories:
  - PlacesRepository – abstract interface providing methods such as
    - Future<List<Place>> getPlacesAroundMe(PlaceCategory category)

- Use Cases:
  - GetPlacesAroundMe – orchestrates fetching places for a category and user location

The UI (ViewModels) will depend on these use cases instead of directly on API clients.

---

## Data Layer (planned)

The data layer will implement the repository interfaces and handle communication
with external services (e.g. Google Places API):

- DTOs:
  - PlaceDto – maps raw API JSON to the Place domain model

- Remote Data Sources:
  - PlacesApi using dio to call remote endpoints

- Repository Implementations:
  - PlacesRepositoryImpl – uses PlacesApi, applies mapping, returns domain models

Error handling, logging, and network concerns will be contained in this layer.

---

## State Management (provider)

Around Me uses provider for state management. In v1, ViewModels (extending
ChangeNotifier) will be created per feature (e.g. HomeViewModel, PlacesViewModel)
and exposed via ChangeNotifierProvider in the widget tree.

These ViewModels will:

- Hold UI state (loading flags, lists of places, selected category, etc.)
- Call domain use cases to load data
- Notify listeners when state changes, causing the UI to rebuild

---

## Future Extensions

- Integrate real location (geolocator) and external APIs (e.g. Google Places)
- Add a map view using google_maps_flutter
- Implement favorites and simple persistence
- Add more detailed documentation for each layer and feature in separate docs files

This document will be updated as the architecture evolves and new layers/features
are added to the Around Me app.