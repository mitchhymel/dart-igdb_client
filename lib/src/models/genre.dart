
class Genres {
  final String name;
  final int id;
  const Genres._private(this.name, this.id);

  static const int _simulatorId = 13;
  static const int _sportId = 14;
  static const int _strategyId = 15;
  static const int _tbsId = 16;
  static const int _hackAndSlashId = 25;
  static const int _quizTriviaId = 26;
  static const int _pinballId = 30;
  static const int _adventureId = 31;
  static const int _indieId = 32;
  static const int _arcadeId = 33;
  static const int _pointAndClickId = 2;
  static const int _fightingId = 4;
  static const int _shooterId = 5;
  static const int _musicId = 7;
  static const int _platformId = 8;
  static const int _puzzleId = 9;
  static const int _racingId = 10;
  static const int _rtsId = 11;
  static const int _rpgId = 12;

  static const Genres SIMULATOR = const Genres._private('Simulator', _simulatorId);
  static const Genres SPORT = const Genres._private('Sport', _sportId);
  static const Genres STRATEGY = const Genres._private('Strategy', _strategyId);
  static const Genres TURN_BASED_STRATEGY = const Genres._private('TBS', _tbsId);
  static const Genres HACK_AND_SLASH = const Genres._private('Hack and slash/Beat \'em up', _hackAndSlashId);
  static const Genres QUIZ_TRIVIA = const Genres._private('Quiz/Trivia', _quizTriviaId);
  static const Genres PINBALL = const Genres._private('Pinball', _pinballId);
  static const Genres ADVENTURE = const Genres._private('Adventure', _adventureId);
  static const Genres INDIE = const Genres._private('Indie', _indieId);
  static const Genres ARCADE = const Genres._private('Arcade', _arcadeId);
  static const Genres POINT_AND_CLICK = const Genres._private('Point-and-click', _pointAndClickId);
  static const Genres FIGHTING = const Genres._private('Fighting', _fightingId);
  static const Genres SHOOTER = const Genres._private('Shooter', _shooterId);
  static const Genres MUSIC = const Genres._private('Music', _musicId);
  static const Genres PLATFORM = const Genres._private('Platform', _platformId);
  static const Genres PUZZLE = const Genres._private('Puzzle', _puzzleId);
  static const Genres RACING = const Genres._private('Racing', _racingId);
  static const Genres REAL_TIME_STRATEGY = const Genres._private('RTS', _rtsId);
  static const Genres ROLE_PLAYING_GAME = const Genres._private('RPG', _rpgId);
  static const Genres NONE = const Genres._private('None', 0);

  static const Map<int, Genres> _map = const {
    _simulatorId: SIMULATOR,
    _sportId: SPORT,
    _strategyId: STRATEGY,
    _tbsId: TURN_BASED_STRATEGY,
    _hackAndSlashId: HACK_AND_SLASH,
    _quizTriviaId: QUIZ_TRIVIA,
    _pinballId: PINBALL,
    _adventureId: ADVENTURE,
    _indieId: INDIE,
    _arcadeId: ARCADE,
    _pointAndClickId: POINT_AND_CLICK,
    _fightingId: FIGHTING,
    _shooterId: SHOOTER,
    _musicId: MUSIC,
    _platformId: PLATFORM,
    _puzzleId: PUZZLE,
    _racingId: RACING,
    _rtsId: REAL_TIME_STRATEGY,
    _rpgId: ROLE_PLAYING_GAME
  };

  static Genres fromInt(int id) {
    return _map.containsKey(id) ? _map[id] : NONE;
  }
}

class Genre {
  DateTime createdAt;
  List<int> games;
  int id;
  String name;
  String slug;
  DateTime updatedAt;
  String url;
}