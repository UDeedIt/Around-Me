// lib/core/config/app_config.dart

/// Global, read-only app configuration.
///
/// This can hold things like API base URLs, feature flags, etc.
/// For now it's just a minimal placeholder to satisfy the global provider.
class AppConfig {
  const AppConfig({
    required this.appName,
  });

  /// Human-readable app name used in various places.
  final String appName;
}
