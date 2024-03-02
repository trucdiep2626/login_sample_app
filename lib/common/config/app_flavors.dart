/// Enum Environment
enum Environment {
  development,
  staging,
  production,
}

/// Flavor value
class Flavor {
  static Environment? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get baseURL {
    switch (appFlavor) {
      case Environment.development:
        return 'https://api-travel-app.tweetworldtravel.com/api/';
      case Environment.staging:
        return 'https://api-travel-app.tweetworldtravel.com/api/';
      case Environment.production:
        return 'https://api-travel-app.tweetworldtravel.com/api/';
      case null:
        return '';
    }
  }
}
