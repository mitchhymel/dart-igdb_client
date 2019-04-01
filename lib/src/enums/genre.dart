
class IGDBGenres {
  final String name;
  final int id;
  const IGDBGenres._private(this.name, this.id);

  static const int _pointAndClickId = 2;
  static const int _fightingId = 4;
  static const int _shooterId = 5;
  static const int _musicId = 7;
  static const int _platformId = 8;
  static const int _puzzleId = 9;
  static const int _racingId = 10;
  static const int _rtsId = 11;
  static const int _rpgId = 12;
  static const int _simulatorId = 13;
  static const int _sportId = 14;
  static const int _strategyId = 15;
  static const int _tbsId = 16;
  static const int _tacticalId = 24;
  static const int _hackAndSlashId = 25;
  static const int _quizTriviaId = 26;
  static const int _pinballId = 30;
  static const int _adventureId = 31;
  static const int _indieId = 32;
  static const int _arcadeId = 33;

  static const IGDBGenres POINT_AND_CLICK = const IGDBGenres._private('Point-and-click', _pointAndClickId);
  static const IGDBGenres FIGHTING = const IGDBGenres._private('Fighting', _fightingId);
  static const IGDBGenres SHOOTER = const IGDBGenres._private('Shooter', _shooterId);
  static const IGDBGenres MUSIC = const IGDBGenres._private('Music', _musicId);
  static const IGDBGenres PLATFORM = const IGDBGenres._private('Platform', _platformId);
  static const IGDBGenres PUZZLE = const IGDBGenres._private('Puzzle', _puzzleId);
  static const IGDBGenres RACING = const IGDBGenres._private('Racing', _racingId);
  static const IGDBGenres REAL_TIME_STRATEGY = const IGDBGenres._private('RTS', _rtsId);
  static const IGDBGenres ROLE_PLAYING_GAME = const IGDBGenres._private('RPG', _rpgId);
  static const IGDBGenres SIMULATOR = const IGDBGenres._private('Simulator', _simulatorId);
  static const IGDBGenres SPORT = const IGDBGenres._private('Sport', _sportId);
  static const IGDBGenres STRATEGY = const IGDBGenres._private('Strategy', _strategyId);
  static const IGDBGenres TURN_BASED_STRATEGY = const IGDBGenres._private('TBS', _tbsId);
  static const IGDBGenres TACTICAL = const IGDBGenres._private('Tactical', _tacticalId);
  static const IGDBGenres HACK_AND_SLASH = const IGDBGenres._private('Hack and slash/Beat \'em up', _hackAndSlashId);
  static const IGDBGenres QUIZ_TRIVIA = const IGDBGenres._private('Quiz/Trivia', _quizTriviaId);
  static const IGDBGenres PINBALL = const IGDBGenres._private('Pinball', _pinballId);
  static const IGDBGenres ADVENTURE = const IGDBGenres._private('Adventure', _adventureId);
  static const IGDBGenres INDIE = const IGDBGenres._private('Indie', _indieId);
  static const IGDBGenres ARCADE = const IGDBGenres._private('Arcade', _arcadeId);
  
  static const IGDBGenres NONE = const IGDBGenres._private('None', 0);

  static const Map<int, IGDBGenres> _map = const {
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

  static IGDBGenres fromInt(int id) {
    return _map[id] ?? NONE;
  }

  static List<IGDBGenres> listFromMapList(List maps) {
    if (maps == null) {
      return new List<IGDBGenres>();
    }

    return maps.map((m) => IGDBGenres.fromInt(m['id'])).toList();
  }
}