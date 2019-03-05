
class IGDBEndpoints {
  static const IGDBEndpoints CHARACTERS = const IGDBEndpoints._private('characters');
  static const IGDBEndpoints COLLECTIONS = const IGDBEndpoints._private('collections');
  static const IGDBEndpoints COMPANIES = const IGDBEndpoints._private('companies');
  static const IGDBEndpoints CREDITS = const IGDBEndpoints._private('credits');
  static const IGDBEndpoints FEEDS = const IGDBEndpoints._private('feeds');
  static const IGDBEndpoints FRANCHISES = const IGDBEndpoints._private('franchises');
  static const IGDBEndpoints GAME_ENGINES = const IGDBEndpoints._private('game_engines');
  static const IGDBEndpoints GAME_MODES = const IGDBEndpoints._private('game_modes');
  static const IGDBEndpoints GAMES = const IGDBEndpoints._private('games');
  static const IGDBEndpoints GENRES = const IGDBEndpoints._private('genres');
  static const IGDBEndpoints KEYWORDS = const IGDBEndpoints._private('keywords');
  static const IGDBEndpoints PAGES = const IGDBEndpoints._private('pages');
  static const IGDBEndpoints PEOPLE = const IGDBEndpoints._private('people');
  static const IGDBEndpoints PLATFORMS = const IGDBEndpoints._private('platforms');
  static const IGDBEndpoints PLAYER_PERSPECTIVES = const IGDBEndpoints._private('player_perspectives');
  static const IGDBEndpoints PULSE_GROUPS = const IGDBEndpoints._private('pulse_groups');
  static const IGDBEndpoints PULSE_SOURCES = const IGDBEndpoints._private('pulse_sources');
  static const IGDBEndpoints PULSES = const IGDBEndpoints._private('pulses');
  static const IGDBEndpoints RELEASE_DATES = const IGDBEndpoints._private('release_dates');
  static const IGDBEndpoints REVIEWS = const IGDBEndpoints._private('reviews');
  static const IGDBEndpoints SCREENSHOTS = const IGDBEndpoints._private('screenshots');
  static const IGDBEndpoints SEARCH = const IGDBEndpoints._private('search');
  static const IGDBEndpoints THEMES = const IGDBEndpoints._private('themes');
  static const IGDBEndpoints TITLES = const IGDBEndpoints._private('titles');
  static const IGDBEndpoints TIME_TO_BEATS = const IGDBEndpoints._private('time_to_beats');

  final String value;
  const IGDBEndpoints._private(this.value);

  @override
  String toString() {
    return this.value;
  }
}