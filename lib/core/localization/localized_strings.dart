// lib/core/localization/localized_strings.dart

import 'package:flutter/widgets.dart';
import '../../l10n/app_localizations.dart';
import '../constants/app_strings.dart';

/// Typed accessors around [AppLocalizations] that provide fallbacks.
class LocalizedStrings {
  LocalizedStrings(this._l10n);

  final AppLocalizations? _l10n;

  String get splashTitle =>
      _l10n?.splashTitle ?? AppStrings.splashTitleFallback;

  String get homeTitle =>
      _l10n?.homeTitle ?? AppStrings.homeTitleFallback;

  String placesTitle({required String category}) =>
      _l10n?.placesTitle(category) ?? AppStrings.placesTitleFallback(category);
}

/// Convenience extension for accessing [LocalizedStrings] from [BuildContext].
extension LocalizedStringsX on BuildContext {
  LocalizedStrings get strings =>
      LocalizedStrings(AppLocalizations.of(this));
}
