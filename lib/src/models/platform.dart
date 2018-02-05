
class Platforms {

  final String name;
  final int id;
  const Platforms._private(this.name, this.id);

  static const int _wiiId = 5;
  static const int _pcId = 6;
  static const int _ps1Id = 7;
  static const int _ps2Id = 8;
  static const int _ps3Id = 9;
  static const int _xboxId = 11;
  static const int _xbox360Id = 12;
  static const int _dsId = 20;
  static const int _gamecubeId = 21;
  static const int _gbcId = 22;
  static const int _dreamcastId = 23;
  static const int _gbaId = 24;
  static const int _3dsId = 37;
  static const int _pspId = 38;
  static const int _wiiUId = 41;
  static const int _psVitaId = 46;
  static const int _ps4Id = 48;
  static const int _xboxOneId = 49;
  static const int _androidId = 34;
  static const int _iosId = 39;
  static const int _linuxId = 3;
  static const int _macId = 14;

  static const Platforms WII = const Platforms._private("Wii", 5);
  static const Platforms PC_WINDOWS = const Platforms._private('PC (Microsoft Windows)', 6);
  static const Platforms PLAYSTATION = const Platforms._private('Playstation', 7);
  static const Platforms PLAYSTATION_2 = const Platforms._private('Playstation 2', 8);
  static const Platforms PLAYSTATION_3 = const Platforms._private('Playstation 3', 9);
  static const Platforms XBOX = const Platforms._private('Xbox', 11);
  static const Platforms XBOX_360 = const Platforms._private('Xbox 360', 12);
  static const Platforms DS = const Platforms._private('Nintendo DS', 20);
  static const Platforms GAMECUBE = const Platforms._private('Nintendo Gamecube', 21);
  static const Platforms GAMEBOY_COLOR = const Platforms._private('Game Boy Color', 22);
  static const Platforms DREAMCAST = const Platforms._private('Dreamcast', 23);
  static const Platforms GAMEBOY_ADVANCE = const Platforms._private('Game Boy Advance', 24);
  static const Platforms NINTENDO_3DS = const Platforms._private('Nintendo 3DS', 37);
  static const Platforms PLAYSTATION_PORTABLE = const Platforms._private('Playstation Portable', 38);
  static const Platforms WIIU = const Platforms._private('Wii U', 41);
  static const Platforms PLAYSTATION_VITA = const Platforms._private('Playstation Vita', 46);
  static const Platforms PLAYSTATION_4 = const Platforms._private('Playstation 4', 48);
  static const Platforms XBOX_ONE = const Platforms._private('Xbox One', 49);
  static const Platforms ANDROID = const Platforms._private('Android', 34);
  static const Platforms IOS = const Platforms._private('iOS', 39);
  static const Platforms LINUX = const Platforms._private('Linux', 3);
  static const Platforms MAC = const Platforms._private('Mac', 14);

  static const Platforms NONE = const Platforms._private('None', 0);

  static const Map<int, Platforms> _map = const {
    _wiiId: WII,
    _pcId: PC_WINDOWS,
    _ps1Id: PLAYSTATION,
    _ps2Id: PLAYSTATION_2,
    _ps3Id: PLAYSTATION_3,
    _xboxId: XBOX,
    _xbox360Id: XBOX_360,
    _dsId: DS,
    _gamecubeId: GAMECUBE,
    _gbcId: GAMEBOY_COLOR,
    _dreamcastId: DREAMCAST,
    _gbaId: GAMEBOY_ADVANCE,
    _3dsId: NINTENDO_3DS,
    _pspId: PLAYSTATION_PORTABLE,
    _wiiUId: WIIU,
    _psVitaId: PLAYSTATION_VITA,
    _ps4Id: PLAYSTATION_4,
    _xboxOneId: XBOX_ONE,
    _androidId: ANDROID,
    _iosId: IOS,
    _linuxId: LINUX,
    _macId: MAC
  };

  static Platforms fromInt(int id) {
    return _map.containsKey(id) ? _map[id] : NONE;
  }

}

class Platform {
  String alternativeName;
  DateTime createdAt;
  List<int> games;
  int id;
  Object logo; //TODO
  String name;
  String slug;
  String summary;
  DateTime updatedAt;
  String url;
  List<Object> versions; //TODO
  String website;
}