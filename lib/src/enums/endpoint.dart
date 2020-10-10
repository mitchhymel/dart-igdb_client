class IGDBEndpoints {
  static const IGDBEndpoints AGE_RATINGS = const IGDBEndpoints._private('age_ratings');
  static const IGDBEndpoints AGE_RATING_CONTENT_DESCRIPTIONS = const IGDBEndpoints._private('age_rating_content_descriptions');
  static const IGDBEndpoints ALTERNATIVE_NAMES = const IGDBEndpoints._private('alternative_names');
  static const IGDBEndpoints ARTWORKS = const IGDBEndpoints._private('artworks');
  static const IGDBEndpoints CHARACTERS = const IGDBEndpoints._private('characters');
  static const IGDBEndpoints CHARACTER_MUG_SHOTS = const IGDBEndpoints._private('character_mug_shots');
  static const IGDBEndpoints COLLECTIONS = const IGDBEndpoints._private('collections');
  static const IGDBEndpoints COMPANIES = const IGDBEndpoints._private('companies');
  static const IGDBEndpoints COMPANY_LOGOS = const IGDBEndpoints._private('company_logos');
  static const IGDBEndpoints COMPANY_WEBSITES = const IGDBEndpoints._private('company_websites');
  static const IGDBEndpoints COVERS = const IGDBEndpoints._private('covers');
  static const IGDBEndpoints EXTERNAL_GAMES = const IGDBEndpoints._private('external_games');
  static const IGDBEndpoints FRANCHISES = const IGDBEndpoints._private('franchises');
  static const IGDBEndpoints GAMES = const IGDBEndpoints._private('games');
  static const IGDBEndpoints GAME_ENGINES = const IGDBEndpoints._private('game_engines');
  static const IGDBEndpoints GAME_ENGINE_LOGOS = const IGDBEndpoints._private('game_engine_logos');
  static const IGDBEndpoints GAME_MODES = const IGDBEndpoints._private('game_modes');
  static const IGDBEndpoints GAME_VERSIONS = const IGDBEndpoints._private('game_versions');
  static const IGDBEndpoints GAME_VERSION_FEATURES = const IGDBEndpoints._private('game_version_features');
  static const IGDBEndpoints GAME_VERSION_FEATURE_VALUES = const IGDBEndpoints._private('game_version_feature_values');
  static const IGDBEndpoints GAME_VIDEOS = const IGDBEndpoints._private('game_videos');
  static const IGDBEndpoints GENRES = const IGDBEndpoints._private('genres');
  static const IGDBEndpoints INVOLVED_COMPANIES = const IGDBEndpoints._private('involved_companies');
  static const IGDBEndpoints KEYWORDS = const IGDBEndpoints._private('keywords');
  static const IGDBEndpoints MULTIPLAYER_MODES = const IGDBEndpoints._private('multiplayer_modes');
  static const IGDBEndpoints PLATFORMS = const IGDBEndpoints._private('platforms');
  static const IGDBEndpoints PLATFORM_FAMILIES = const IGDBEndpoints._private('platform_families');
  static const IGDBEndpoints PLATFORM_LOGOS = const IGDBEndpoints._private('platform_logos');
  static const IGDBEndpoints PLATFORM_VERSIONS = const IGDBEndpoints._private('platform_versions');
  static const IGDBEndpoints PLATFORM_VERSION_COMPANIES = const IGDBEndpoints._private('platform_version_companies');
  static const IGDBEndpoints PLATFORM_VERSION_RELEASE_DATES = const IGDBEndpoints._private('platform_version_release_dates');
  static const IGDBEndpoints PLATFORM_WEBSITES = const IGDBEndpoints._private('platform_websites');
  static const IGDBEndpoints PLAYER_PERSPECTIVES = const IGDBEndpoints._private('player_perspectives');
  static const IGDBEndpoints RELEASE_DATES = const IGDBEndpoints._private('release_dates');
  static const IGDBEndpoints SCREENSHOTS = const IGDBEndpoints._private('screenshots');
  static const IGDBEndpoints SEARCH = const IGDBEndpoints._private('search');
  static const IGDBEndpoints THEMES = const IGDBEndpoints._private('themes');
  static const IGDBEndpoints WEBSITES = const IGDBEndpoints._private('websites');

  final String value;
  const IGDBEndpoints._private(this.value);

  @override
  String toString() {
    return this.value;
  }
}