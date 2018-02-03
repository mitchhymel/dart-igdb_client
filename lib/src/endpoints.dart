
class Endpoint {
  static const Endpoint CHARACTERS = const Endpoint._private('characters');
  static const Endpoint COLLECTIONS = const Endpoint._private('collections');
  static const Endpoint COMPANIES = const Endpoint._private('companies');
  static const Endpoint CREDITS = const Endpoint._private('credits');
  static const Endpoint FEEDS = const Endpoint._private('feeds');
  static const Endpoint FRANCHISES = const Endpoint._private('franchises');
  static const Endpoint GAME_ENGINES = const Endpoint._private('game_engines');
  static const Endpoint GAME_MODES = const Endpoint._private('game_modes');
  static const Endpoint GAMES = const Endpoint._private('games');
  static const Endpoint GENRES = const Endpoint._private('genres');
  static const Endpoint KEYWORDS = const Endpoint._private('keywords');
  static const Endpoint PAGES = const Endpoint._private('pages');
  static const Endpoint PEOPLE = const Endpoint._private('people');
  static const Endpoint PLATFORMS = const Endpoint._private('platforms');
  static const Endpoint PLAYER_PERSPECTIVES = const Endpoint._private('player_perspectives');
  static const Endpoint PULSE_GROUPS = const Endpoint._private('pulse_groups');
  static const Endpoint PULSE_SOURCES = const Endpoint._private('pulse_sources');
  static const Endpoint PULSES = const Endpoint._private('pulses');
  static const Endpoint RELEASE_DATES = const Endpoint._private('release_dates');
  static const Endpoint REVIEWS = const Endpoint._private('reviews');
  static const Endpoint THEMES = const Endpoint._private('themes');
  static const Endpoint TITLES = const Endpoint._private('titles');

  final String value;
  const Endpoint._private(this.value);
}