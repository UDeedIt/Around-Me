// lib/features/places/place_details_screen.dart

import 'package:flutter/material.dart';
import '../../domain/models/place.dart';

/// A screen that displays detailed information for a single [Place].
///
/// This screen is intended to be opened when the user taps a place item
/// from the places list.
///
/// It shows:
/// - the main image, if available
/// - the place name
/// - the description, if available
/// - the address
/// - the rating, if available
/// - the open/closed status, if available
///
/// The widget is stateless because it only renders the data passed in
/// through the [place] parameter and does not manage mutable UI state.
class PlaceDetailsScreen extends StatelessWidget {
  /// The place whose details will be displayed on this screen.
  final Place place;

  /// Creates a new [PlaceDetailsScreen].
  ///
  /// The [place] argument is required because this screen cannot render
  /// meaningful content without the selected place data.
  const PlaceDetailsScreen({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    // Check whether a valid image URL is available.
    //
    // We guard against both null and empty string values so the UI does not
    // try to render a broken or blank image area unnecessarily.
    final bool hasImage = place.imageUrl != null && place.imageUrl!.isNotEmpty;

    // Check whether a non-empty description exists.
    //
    // This allows us to hide the description section entirely when the place
    // does not provide one, keeping the layout clean.
    final bool hasDescription =
        place.description != null && place.description!.isNotEmpty;

    // Check whether a rating exists.
    //
    // Some places may not have a rating, so we only show that row when data
    // is actually available.
    final bool hasRating = place.rating != null;

    // Check whether open/closed information exists.
    //
    // Some APIs or local data sources may omit the current opening state.
    final bool hasOpenStatus = place.isOpenNow != null;

    return Scaffold(
      // The top app bar displays the selected place name.
      appBar: AppBar(
        title: Text(place.name),
      ),

      // Use SafeArea to avoid system UI overlaps such as notches or status bars.
      body: SafeArea(
        // Use SingleChildScrollView so the screen remains scrollable on
        // smaller devices or when content grows larger in the future.
        child: SingleChildScrollView(
          // Apply consistent outer spacing around all content.
          padding: const EdgeInsets.all(16),
          child: Column(
            // Align all content to the left/start side.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Show the main place image only if a valid image URL exists.
              if (hasImage)
                ClipRRect(
                  // Rounded corners help the image match the app's modern card-like UI.
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    place.imageUrl!,

                    // Stretch image to fill available width.
                    width: double.infinity,

                    // Fixed height keeps the hero/media section visually stable.
                    height: 220,

                    // Cover ensures the image fills the box without distortion.
                    fit: BoxFit.cover,

                    // Optional loading builder to provide better perceived UX
                    // while the image is still downloading.
                    loadingBuilder: (context, child, loadingProgress) {
                      // If loading is complete, render the final image.
                      if (loadingProgress == null) {
                        return child;
                      }

                      // While loading, show a placeholder container with a spinner.
                      return Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.grey.shade200,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      );
                    },

                    // If the image fails to load, show a graceful fallback.
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.grey.shade200,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.broken_image_outlined,
                          size: 48,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

              // Add vertical spacing below the image only when the image exists.
              if (hasImage) const SizedBox(height: 16),

              // Main place title.
              //
              // This is repeated from the app bar because users may scroll,
              // and it also helps create a strong visual hierarchy in the body.
              Text(
                place.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(height: 12),

              // Show the description section only when description text exists.
              if (hasDescription) ...[
                // Section label to make the content easier to scan.
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),

                // The place description itself.
                Text(
                  place.description!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
              ],

              // Address section.
              Text(
                'Address',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              // Display the place address.
              Text(
                place.address,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 16),

              // Show the rating section only if a rating is available.
              if (hasRating) ...[
                Text(
                  'Rating',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),

                // Use a row to pair an icon with the rating text.
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${place.rating}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],

              // Show the status section only if opening status is available.
              if (hasOpenStatus) ...[
                Text(
                  'Status',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),

                // Use a row with a colored icon and colored text to make the
                // state visually easy to understand.
                Row(
                  children: [
                    Icon(
                      // Use a check-circle for open and a cancel/close icon for closed.
                      place.isOpenNow!
                          ? Icons.check_circle
                          : Icons.cancel_outlined,

                      // Green for open, red for closed.
                      color: place.isOpenNow! ? Colors.green : Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      place.isOpenNow! ? 'Open now' : 'Closed now',
                      style: TextStyle(
                        color: place.isOpenNow! ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
