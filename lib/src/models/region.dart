
class Regions {
  final String name;
  final int id;
  const Regions._private(this.name, this.id);

  static const int _europeId = 1;
  static const int _naId = 2;
  static const int _australiaId = 3;
  static const int _newZealandId = 4;
  static const int _japanId = 5;
  static const int _chinaId = 6;
  static const int _asiaId = 7;
  static const int _worldwideId = 8;

  static const Regions EUROPE = const Regions._private('Europe', _europeId);
  static const Regions NORTH_AMERICA = const Regions._private('North America', _naId);
  static const Regions AUSTRALIA = const Regions._private('Australia', _australiaId);
  static const Regions NEW_ZEALAND = const Regions._private('New Zealand', _newZealandId);
  static const Regions JAPAN = const Regions._private('Japan', _japanId);
  static const Regions CHINA = const Regions._private('China', _chinaId);
  static const Regions ASIA = const Regions._private('Asia', _asiaId);
  static const Regions WORLDWIDE = const Regions._private('Worldwide', _worldwideId);
  static const Regions NONE = const Regions._private('None', 0);

  static const Map<int, Regions> _map = const {
    _europeId: EUROPE,
    _naId: NORTH_AMERICA,
    _australiaId: AUSTRALIA,
    _newZealandId: NEW_ZEALAND,
    _japanId: JAPAN,
    _chinaId: CHINA,
    _asiaId: ASIA,
    _worldwideId: WORLDWIDE
  };

  static Regions fromInt(int id) {
    return _map[id] ?? NONE;
  }

  static List<Regions> all() {
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