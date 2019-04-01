import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/enums/enums.dart';
import 'package:igdb_client/src/request_parameters.dart';
import 'package:igdb_client/src/igdb_response.dart';
import 'package:igdb_client/src/igdb_logger.dart';

/**
 * A client for calling IGDB's API.
 * 
 * See IGDB's documentation of their API at https://api-docs.igdb.com/.
 * There you'll find more details on how to interact with their API, as well
 * as the structure of response objects.
 */
class IGDBClient {

  final String apiKey;
  final String userAgent;
  final String apiUrl = "https://api-v3.igdb.com";
  final IGDBLogger logger;

  /**
   * Constructor. Requires a [userAgent] and [apiKey].
   * 
   * If you want to log all requests and responses, override
   * [IGDBLogger] and provide an instance as [this.logger]
   */
  IGDBClient(this.userAgent, this.apiKey,
      {this.logger}) {}

  /**
   * Makes a POST request to the [url] with provided [body].
   * 
   * You generally shouldn't need to use this method directly, and instead
   * it's recommended to use [requestByPath] or the corresponding method
   * for the endpoint you're trying to reach.
   */
  Future<IGDBResponse> makeRequest(String url, String body) async {
    var uri = Uri.parse(url);
    var httpClient = new HttpClient();
    var request = await httpClient.postUrl(uri);
    request..headers.add('user-key', apiKey)
      ..headers.add('User-Agent', userAgent)
      ..headers.add('Accept', 'application/json')
      ..write(body);

    if (logger != null) {
      logger.logRequest(request, body);
    }

    var resp = await request.close();
    var responseBody = await resp.transform(utf8.decoder).join();
    
    var error = null;
    var data = null;
    if (resp.statusCode != 200) {
      error = json.decode(responseBody);
    }
    else {
      data = json.decode(responseBody);
    }

    var result = new IGDBResponse(resp.statusCode, error, data);

    if (logger != null) {
      logger.logResponse(result);
    }

    return result;
  }

  /**
   * Makes a request to url at [apiUrl]/[path] with provided [params].
   * 
   * Use this method if you are trying to call an endpoint that does not have
   * a specific method implemented in this client or there does not exist
   * an [IDGBEndpoints] enum for it.
   */
  Future<IGDBResponse> requestByPath(
    String path, IGDBRequestParameters params) async {
    return await makeRequest("${apiUrl}/$path", params.toBody());
  }

  Future<IGDBResponse> _requestByEndpoint(
    IGDBEndpoints endpoint, IGDBRequestParameters params) async {
    return await makeRequest("${apiUrl}/${endpoint.toString()}", params.toBody());
  }

  Future<IGDBResponse> achievements(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.ACHIEVEMENTS, params);
  }

  Future<IGDBResponse> achievement_icons(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.ACHIEVEMENT_ICONS, params);
  }

  Future<IGDBResponse> ageRatings(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.AGE_RATINGS, params);
  }

  Future<IGDBResponse> ageRatingContentDescriptions(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.AGE_RATING_CONTENT_DESCRIPTIONS, params);
  }

  Future<IGDBResponse> alternativeNames(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.ALTERNATIVE_NAMES, params);
  }

  Future<IGDBResponse> artworks(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.ARTWORKS, params);
  }

  Future<IGDBResponse> characters(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.CHARACTERS, params);
  }

  Future<IGDBResponse> characterMugShots(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.CHARACTER_MUG_SHOTS, params);
  }

  Future<IGDBResponse> collections(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COLLECTIONS, params);
  }

  Future<IGDBResponse> companies(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COMPANIES, params);
  }

  Future<IGDBResponse> companyLogos(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COMPANY_LOGOS, params);
  }

  Future<IGDBResponse> companyWebsites(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COMPANY_WEBSITES, params);
  }

  Future<IGDBResponse> covers(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COVERS, params);
  }

  Future<IGDBResponse> credits(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.CREDITS, params);
  }

  Future<IGDBResponse> externalGames(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.EXTERNAL_GAMES, params);
  }

  Future<IGDBResponse> feeds(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.FEEDS, params);
  }

  Future<IGDBResponse> franchises(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.FRANCHISES, params);
  }

  Future<IGDBResponse> games(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAMES, params);
  }

  Future<IGDBResponse> gameEngines(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_ENGINES, params);
  }

  Future<IGDBResponse> gameEngineLogos(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_ENGINE_LOGOS, params);
  }

  Future<IGDBResponse> gameModes(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_MODES, params);
  }

  Future<IGDBResponse> gameVideos(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_VIDEOS, params);
  }

  Future<IGDBResponse> gameVersions(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_VERSIONS, params);
  }

  Future<IGDBResponse> gameVersionFeatures(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_VERSION_FEATURES, params);
  }

  Future<IGDBResponse> gameVersionFeatureValues(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_VERSION_FEATURE_VALUES, params);
  }

  Future<IGDBResponse> genres(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GENRES, params);
  }

  Future<IGDBResponse> involvedCompanies(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.INVOLVED_COMPANIES, params);
  }

  Future<IGDBResponse> keywords(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.KEYWORDS, params);
  }

  Future<IGDBResponse> multiplayerModes(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.MULTIPLAYER_MODES, params);
  }

  Future<IGDBResponse> pages(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PAGES, params);
  }

  Future<IGDBResponse> pageBackgrounds(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PAGE_BACKGROUNDS, params);
  }
  
  Future<IGDBResponse> pageLogos(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PAGE_LOGOS, params);
  }
  
  Future<IGDBResponse> pageWebsites(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PAGE_WEBSITES, params);
  }

  Future<IGDBResponse> people(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PEOPLE, params);
  }

  Future<IGDBResponse> platforms(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORMS, params);
  }

  Future<IGDBResponse> platformLogos(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_LOGOS, params);
  }
  
  Future<IGDBResponse> platformVersions(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_VERSIONS, params);
  }
  
  Future<IGDBResponse> platformVersionCompanies(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_VERSION_COMPANIES, params);
  }
  
  Future<IGDBResponse> platformVersionReleaseDates(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_VERSION_RELEASE_DATES, params);
  }
  
  Future<IGDBResponse> platformWebsites(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_WEBSITES, params);
  }

  Future<IGDBResponse> playerPerspectives(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLAYER_PERSPECTIVES, params);
  }
  
  Future<IGDBResponse> productFamilies(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PRODUCT_FAMILIES, params);
  }

  Future<IGDBResponse> pulses(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PULSES, params);
  }

  Future<IGDBResponse> pulseGroups(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PULSE_GROUPS, params);
  }

  Future<IGDBResponse> pulseSources(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PULSE_SOURCES, params);
  }

  Future<IGDBResponse> pulseUrls(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PULSE_URLS, params);
  }

  Future<IGDBResponse> releaseDates(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.RELEASE_DATES, params);
  }

  Future<IGDBResponse> reviews(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.REVIEWS, params);
  }

  Future<IGDBResponse> search(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.SEARCH, params);
  }

  Future<IGDBResponse> themes(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.THEMES, params);
  }

  Future<IGDBResponse> timeToBeats(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.TIME_TO_BEATS, params);
  }

  Future<IGDBResponse> titles(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.TITLES, params);
  }

  Future<IGDBResponse> websites(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.WEBSITES, params);
  }
}
