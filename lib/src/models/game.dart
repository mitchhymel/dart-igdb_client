
import 'package:igdb_client/src/models.dart';

class Game {
  final int id;
  final String name;
  final String slug;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String summary;
  final String storyline;
  final int collection; // expandable
  final int franchise; // expandable
  final int hypes;
  final double popularity;
  final double rating;
  final int ratingCount;
  final double aggregatedRating;
  final int aggregatedRatingCount;
  final double totalRating;
  final int totalRatingCount;
  final int game; // expandable
  final int versionParent;
  final List<dynamic> developers; //expandable
  final List<dynamic> publishers; //expandable
  final List<dynamic> gameEngines; //expandable
  final int category;
  final Map timeToBeat;
  final List<dynamic> playerPerspectives;
  final List<dynamic> gameModes;
  final List<dynamic> keywords;
  final List<dynamic> themes;
  final List<Genres> genres;
  final List<Platforms> platforms;
  final DateTime firstReleaseDate;
  final int status;
  final List<ReleaseDate> releaseDates;
  final List<dynamic> alternativeNames;
  final List<Image> screenshots;
  final List<dynamic> videos;
  final Image cover;
  final Map esrb;
  final Map pegi;
  final List<dynamic> websites;
  final List<dynamic> tags;
  final List<dynamic> dlcs; //expandable
  final List<dynamic> expansions; //expandable
  final List<dynamic> standaloneExpansions; //expandable
  final List<dynamic> bundles; //expandable
  final List<dynamic> games; //expandable
  final Map external;

  Game({
    this.id,
    this.name,
    this.slug,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.summary,
    this.storyline,
    this.collection,
    this.franchise,
    this.hypes,
    this.popularity,
    this.rating,
    this.ratingCount,
    this.aggregatedRating,
    this.aggregatedRatingCount,
    this.totalRating,
    this.totalRatingCount,
    this.game,
    this.versionParent,
    this.developers,
    this.publishers,
    this.gameEngines,
    this.category,
    this.timeToBeat,
    this.playerPerspectives,
    this.gameModes,
    this.keywords,
    this.themes,
    this.genres,
    this.platforms,
    this.firstReleaseDate,
    this.status,
    this.releaseDates,
    this.alternativeNames,
    this.screenshots,
    this.videos,
    this.cover,
    this.esrb,
    this.pegi,
    this.websites,
    this.tags,
    this.dlcs,
    this.expansions,
    this.standaloneExpansions,
    this.bundles,
    this.games,
    this.external
  });


  static Game fromMap(Map map) {
    return new Game(
      id: map['id'],
      name: map['name'],
      slug: map['slug'],
      url: map['url'],
      createdAt: dateTimeFromMsecSinceEpoch(map['created_at']),
      updatedAt: dateTimeFromMsecSinceEpoch(map['updated_at']),
      summary: map['summary'],
      storyline: map['storyline'],
      collection: map['collection'],
      franchise: map['franchise'],
      hypes: map['hypes'],
      popularity: map['popularity'],
      rating: map['rating'],
      ratingCount: map['ratingCount'],
      aggregatedRating: map['aggregated_rating'],
      aggregatedRatingCount: map['aggregated_rating_count'],
      totalRating: map['total_rating'],
      totalRatingCount: map['total_rating_count'],
      game: map['game'],
      versionParent: map['version_parent'],
      developers: map['developers'],
      publishers: map['publishers'],
      gameEngines: map['game_engines'],
      category: map['category'],
      timeToBeat: map['time_to_beat'],
      playerPerspectives: map['player_perspectives'],
      gameModes: map['game_modes'],
      keywords: map['keywords'],
      themes: map['themes'],
      genres: Genres.listFromMap(map),
      platforms: Platforms.listFromMap(map),
      firstReleaseDate: dateTimeFromMsecSinceEpoch(map['first_release_date']),
      status: map['status'],
      releaseDates: ReleaseDate.listFromMap(map, expandGame: false),
      alternativeNames: map['alternative_names'],
      screenshots: Image.listFromMapList(map['screenshots']),
      videos: map['videos'],
      cover: Image.fromMap(map['cover']),
      esrb: map['esrb'],
      pegi: map['pegi'],
      websites: map['websites'],
      tags: map['tags'],
      dlcs: map['dlcs'],
      expansions: map['expansions'],
      standaloneExpansions: map['standalone_expansions'],
      bundles: map['bundles'],
      games: map['games'],
      external: map['external']
    );
  }

  static List<Game> listFromMapList(List<dynamic> maps) {
    if (maps != null) {
      return maps.map((m) => fromMap(m)).toList();
    }

    return new List<Game>();
  }
}
