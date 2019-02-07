
class IGDBRegions {
  final String name;
  final int id;
  const IGDBRegions._private(this.name, this.id);

  static const int _europeId = 1;
  static const int _naId = 2;
  static const int _australiaId = 3;
  static const int _newZealandId = 4;
  static const int _japanId = 5;
  static const int _chinaId = 6;
  static const int _asiaId = 7;
  static const int _worldwideId = 8;

  static const IGDBRegions EUROPE = const IGDBRegions._private('Europe', _europeId);
  static const IGDBRegions NORTH_AMERICA = const IGDBRegions._private('North America', _naId);
  static const IGDBRegions AUSTRALIA = const IGDBRegions._private('Australia', _australiaId);
  static const IGDBRegions NEW_ZEALAND = const IGDBRegions._private('New Zealand', _newZealandId);
  static const IGDBRegions JAPAN = const IGDBRegions._private('Japan', _japanId);
  static const IGDBRegions CHINA = const IGDBRegions._private('China', _chinaId);
  static const IGDBRegions ASIA = const IGDBRegions._private('Asia', _asiaId);
  static const IGDBRegions WORLDWIDE = const IGDBRegions._private('Worldwide', _worldwideId);
  static const IGDBRegions NONE = const IGDBRegions._private('None', null);

  static const Map<int, IGDBRegions> _map = const {
    _europeId: EUROPE,
    _naId: NORTH_AMERICA,
    _australiaId: AUSTRALIA,
    _newZealandId: NEW_ZEALAND,
    _japanId: JAPAN,
    _chinaId: CHINA,
    _asiaId: ASIA,
    _worldwideId: WORLDWIDE
  };

  static IGDBRegions fromInt(int id) {
    if (id == null) {
      return WORLDWIDE;
    }
    else if (_map[id] == null) {
      return NONE;
    }

    return _map[id];
  }

  static List<IGDBRegions> all() {
    return _map.values.toList();
  }

  @override
  String toString() {
    return this.toMap().toString();
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

}