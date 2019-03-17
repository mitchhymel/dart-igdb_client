
class IGDBPlatforms {

  final String name;
  final int id;
  const IGDBPlatforms._private(this.name, this.id);

  static const int _linuxId = 3;
  static const int _n64Id = 4;
  static const int _wiiId = 5;
  static const int _pcId = 6;
  static const int _ps1Id = 7;
  static const int _ps2Id = 8;
  static const int _ps3Id = 9;
  static const int _xboxId = 11;
  static const int _xbox360Id = 12;
  static const int _pcdosId = 13;
  static const int _macId = 14;
  static const int _commodoreId = 15;
  static const int _nesId = 18;
  static const int _snesId = 19;
  static const int _dsId = 20;
  static const int _gamecubeId = 21;
  static const int _gbcId = 22;
  static const int _dreamcastId = 23;
  static const int _gbaId = 24;
  static const int _amstradCpcId = 25;
  static const int _msxId = 27;
  static const int _segaGenesisId = 29;
  static const int _segaSaturnId = 32;
  static const int _gameBoyId = 33;
  static const int _androidId = 34;
  static const int _xboxLiveArcadeId = 36;
  static const int _3dsId = 37;
  static const int _pspId = 38;
  static const int _iosId = 39;
  static const int _wiiUId = 41;
  static const int _psnId = 45;
  static const int _psVitaId = 46;
  static const int _vcId = 47;
  static const int _ps4Id = 48;
  static const int _xboxOneId = 49;
  static const int _familyComputerDiskId = 51;
  static const int _switchId = 130;
  static const int _nintendoEshopId = 160;
  static const int _steamVrId = 163;
  static const int _daydreamId = 164;
  static const int _psVrId = 165;

  static const IGDBPlatforms LINUX = const IGDBPlatforms._private('Linux', _linuxId);
  static const IGDBPlatforms N64 = const IGDBPlatforms._private('Nintendo 64', _n64Id);
  static const IGDBPlatforms WII = const IGDBPlatforms._private("Wii", _wiiId);
  static const IGDBPlatforms PC_WINDOWS = const IGDBPlatforms._private('PC (Microsoft Windows)', _pcId);
  static const IGDBPlatforms PLAYSTATION = const IGDBPlatforms._private('Playstation', _ps1Id);
  static const IGDBPlatforms PLAYSTATION_2 = const IGDBPlatforms._private('Playstation 2', _ps2Id);
  static const IGDBPlatforms PLAYSTATION_3 = const IGDBPlatforms._private('Playstation 3', _ps3Id);
  static const IGDBPlatforms XBOX = const IGDBPlatforms._private('Xbox', _xboxId);
  static const IGDBPlatforms XBOX_360 = const IGDBPlatforms._private('Xbox 360', _xbox360Id);
  static const IGDBPlatforms PC_DOS = const IGDBPlatforms._private('PC DOS', _pcdosId);
  static const IGDBPlatforms MAC = const IGDBPlatforms._private('Mac', _macId);
  static const IGDBPlatforms COMMODORE_C64 = const IGDBPlatforms._private('Commodore C64/128', _commodoreId);
  static const IGDBPlatforms NES = const IGDBPlatforms._private('Nintendo Entertainment System (NES)', _nesId);
  static const IGDBPlatforms SUPER_NINTENDO = const IGDBPlatforms._private('Super Nintendo Entertainment System (SNES)', _snesId);
  static const IGDBPlatforms DS = const IGDBPlatforms._private('Nintendo DS', _dsId);
  static const IGDBPlatforms GAMECUBE = const IGDBPlatforms._private('Nintendo Gamecube', _gamecubeId);
  static const IGDBPlatforms GAMEBOY_COLOR = const IGDBPlatforms._private('Game Boy Color', _gbcId);
  static const IGDBPlatforms DREAMCAST = const IGDBPlatforms._private('Dreamcast', _dreamcastId);
  static const IGDBPlatforms GAMEBOY_ADVANCE = const IGDBPlatforms._private('Game Boy Advance', _gbaId);
  static const IGDBPlatforms AMSTRAD_CPC = const IGDBPlatforms._private('Amstrad CPC', _amstradCpcId);
  static const IGDBPlatforms MSX = const IGDBPlatforms._private('MSX', _msxId);
  static const IGDBPlatforms SEGA_GENESIS = const IGDBPlatforms._private('Sega Mega Drive/Genesis', _segaGenesisId);
  static const IGDBPlatforms SEGA_SATURN = const IGDBPlatforms._private('Sega Saturn', _segaSaturnId);
  static const IGDBPlatforms GAMEBOY = const IGDBPlatforms._private('Game Boy', _gameBoyId);
  static const IGDBPlatforms ANDROID = const IGDBPlatforms._private('Android', _androidId);
  static const IGDBPlatforms XBOX_LIVE_ARCADE = const IGDBPlatforms._private('Xbox Live Arcade', _xboxLiveArcadeId);
  static const IGDBPlatforms NINTENDO_3DS = const IGDBPlatforms._private('Nintendo 3DS', _3dsId);
  static const IGDBPlatforms PLAYSTATION_PORTABLE = const IGDBPlatforms._private('Playstation Portable', _pspId);
  static const IGDBPlatforms IOS = const IGDBPlatforms._private('iOS', _iosId);
  static const IGDBPlatforms WIIU = const IGDBPlatforms._private('Wii U', _wiiUId);
  static const IGDBPlatforms PLAYSTATION_NETWORK = const IGDBPlatforms._private('Playstation Network', _psnId);
  static const IGDBPlatforms PLAYSTATION_VITA = const IGDBPlatforms._private('Playstation Vita', _psVitaId);
  static const IGDBPlatforms VIRTUAL_CONSOLE = const IGDBPlatforms._private('Virtual Console (Nintendo)', _vcId);
  static const IGDBPlatforms PLAYSTATION_4 = const IGDBPlatforms._private('Playstation 4', _ps4Id);
  static const IGDBPlatforms XBOX_ONE = const IGDBPlatforms._private('Xbox One', _xboxOneId);
  static const IGDBPlatforms FAMILY_COMPUTER_DISK_SYSTEM = const IGDBPlatforms._private('Family Computer Disk System', _familyComputerDiskId);
  static const IGDBPlatforms SWITCH = const IGDBPlatforms._private('Switch', _switchId);
  static const IGDBPlatforms ESHOP = const IGDBPlatforms._private('Nintendo eShop', _nintendoEshopId);
  static const IGDBPlatforms STEAMVR = const IGDBPlatforms._private('SteamVR', _steamVrId);
  static const IGDBPlatforms DAYDREAM = const IGDBPlatforms._private('Daydream', _daydreamId);
  static const IGDBPlatforms PLAYSTATION_VR = const IGDBPlatforms._private('Playstation VR', _psVrId);

  static const IGDBPlatforms NONE = const IGDBPlatforms._private('None', 0);

  static const Map<int, IGDBPlatforms> _map = const {
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
    _macId: MAC,
    _switchId: SWITCH,
  };

  static IGDBPlatforms fromInt(int id) {
    return _map[id] ?? NONE;
  }

  static List<IGDBPlatforms> listFromMapList(List maps) {
    if (maps == null) {
      return new List<IGDBPlatforms>();
    }

    return maps.map((m) => IGDBPlatforms.fromInt(m['id'])).toList();
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