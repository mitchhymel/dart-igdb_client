
import 'package:igdb_client/src/models.dart';

class ReleaseDate {
  final int id;
  final int game;
  final Game gameExpanded;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int category;
  final Platforms platform;
  final DateTime date;
  final Regions region;
  final int y;
  final int m;
  final String human;

  ReleaseDate({
    this.id,
    this.game,
    this.gameExpanded,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.platform,
    this.date,
    this.region,
    this.y,
    this.m,
    this.human
  });

  @override
  String toString() {
    return this.toMap().toString();
  }

  static ReleaseDate fromMap(Map map, {bool expandGame = false}) {
    // release dates allow expanding of game
    // if the game is just an int, expand was not used,
    // if the game is a map, then expand was used
    if (expandGame) {
      return new ReleaseDate(
          gameExpanded: Game.fromMap(map['game']),
          id: map['id'],
          createdAt: dateTimeFromMsecSinceEpoch(map['created_at']),
          updatedAt: dateTimeFromMsecSinceEpoch(map['updated_at']),
          category: map['category'],
          platform: Platforms.fromInt(map['platform']),
          date: dateTimeFromMsecSinceEpoch(map['date']),
          region: Regions.fromInt(map['region']),
          y: map['y'],
          m: map['m'],
          human: map['human']
      );
    }
    else {
      return new ReleaseDate(
          id: map['id'],
          game: map['game'],
          createdAt: dateTimeFromMsecSinceEpoch(map['created_at']),
          updatedAt: dateTimeFromMsecSinceEpoch(map['updated_at']),
          category: map['category'],
          platform: Platforms.fromInt(map['platform']),
          date: dateTimeFromMsecSinceEpoch(map['date']),
          region: Regions.fromInt(map['region']),
          y: map['y'],
          m: map['m'],
          human: map['human']
      );
    }
  }

  static List<ReleaseDate> listFromMap(Map map, {bool expandGame=false}) {
    List<ReleaseDate> result = new List<ReleaseDate>();
    List dates = map['release_dates'];
    if (dates != null) {
      for (Map date in dates) {
        result.add(fromMap(date, expandGame: expandGame));
      }
    }

    return result;
  }

  Map toMap() {
    return {
      'id': id,
      'game': game,
      'date': date,
      'platform': platform,
      'region': region,
      'gameExpanded': gameExpanded,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'category': category,
      'y': y,
      'm': m,
      'human': human,
    };
  }
}