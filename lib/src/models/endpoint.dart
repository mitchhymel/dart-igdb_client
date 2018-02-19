
class Endpoints {
  static const Endpoints CHARACTERS = const Endpoints._private('characters');
  static const Endpoints COLLECTIONS = const Endpoints._private('collections');
  static const Endpoints COMPANIES = const Endpoints._private('companies');
  static const Endpoints CREDITS = const Endpoints._private('credits');
  static const Endpoints FEEDS = const Endpoints._private('feeds');
  static const Endpoints FRANCHISES = const Endpoints._private('franchises');
  static const Endpoints GAME_ENGINES = const Endpoints._private('game_engines');
  static const Endpoints GAME_MODES = const Endpoints._private('game_modes');
  static const Endpoints GAMES = const Endpoints._private('games');
  static const Endpoints GENRES = const Endpoints._private('genres');
  static const Endpoints KEYWORDS = const Endpoints._private('keywords');
  static const Endpoints PAGES = const Endpoints._private('pages');
  static const Endpoints PEOPLE = const Endpoints._private('people');
  static const Endpoints PLATFORMS = const Endpoints._private('platforms');
  static const Endpoints PLAYER_PERSPECTIVES = const Endpoints._private('player_perspectives');
  static const Endpoints PULSE_GROUPS = const Endpoints._private('pulse_groups');
  static const Endpoints PULSE_SOURCES = const Endpoints._private('pulse_sources');
  static const Endpoints PULSES = const Endpoints._private('pulses');
  static const Endpoints RELEASE_DATES = const Endpoints._private('release_dates');
  static const Endpoints REVIEWS = const Endpoints._private('reviews');
  static const Endpoints THEMES = const Endpoints._private('themes');
  static const Endpoints TITLES = const Endpoints._private('titles');

  final String value;
  const Endpoints._private(this.value);
}