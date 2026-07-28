# Around Me (Flutter City Guide)

Around Me is a Flutter city guide app that shows interesting places around the user
(restaurants, cafés, sights, parks, etc.).

---

## Goals

- Demonstrate modern Flutter app architecture with clean, readable code
- Show integration with location services and external web APIs
- Provide a simple but extensible base for future “city guide” / “around me” features

---

## Tech Stack (planned)

- Flutter 3.x
- State management: **provider**
- HTTP client: **dio**
- Location: e.g. `geolocator` (current user position)
- (Later) Map: `google_maps_flutter` or similar
- Target platforms: Android (primary), iOS

---

## Planned Features (v1)

- Home screen with categories (e.g. Cafés, Restaurants, Sights, Parks)
- "Places around me" list for a selected category
    - Name, address, distance from current location
- Place details screen
    - Basic info (name, address, category)
    - Distance and description
- Integration with a web service (e.g. Google Places) for real data

---

This repository currently contains the initial Flutter project setup and basic
project structure (as part of Jira epic **AROUND‑1 AroundMe app foundation**).
More features will be added iteratively.
