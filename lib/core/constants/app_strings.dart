// lib/core/constants/app_strings.dart

/// Non-localized string constants.
///
/// All user-facing, localized text should live in ARB files and be accessed
/// via [AppLocalizations]. This class is only for rare fallbacks or
/// technical labels that are not meant to be localized.
class AppStrings {

  static const appTitleFallback = 'Around Me';
  static const splashTitleFallback = 'Around Me';
  static const homeTitleFallback = 'Around Me';

  static String placesTitleFallback(String category) =>
      '$category around me';
}
