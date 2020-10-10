import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/enums/enums.dart';
import 'package:igdb_client/src/igdb_token.dart';
import 'package:igdb_client/src/request_parameters.dart';
import 'package:igdb_client/src/igdb_response.dart';
import 'package:igdb_client/src/igdb_logger.dart';

/**
 * A client for calling IGDB's API.
 * 
 * See IGDB's documentation of their API at https://api-docs.igdb.com/.
 * There you'll find more details on how to interact with their API, as well
 * as the structure of response objects.
 * 
 * Note: As of the v4 API, this is not meant to be used directly within web
 * or mobile applications. IGDB recommends instead using a proxy.
 * See latest documentation at: https://api-docs.igdb.com/#web-and-mobile-applications
 */
class IGDBClient {
  final String clientId;
  final String clientSecret;
  final String userAgent;
  final IGDBLogger logger;
  
  IGDBToken token;
  static const String tokenUrl = 'https://id.twitch.tv/oauth2/token';

  static const apiUrl = 'https://api.igdb.com/v4';


  /**
   * The way to get an instance of IGDBClient. Requires a [userAgent] and
   * Twitch Develeoper [clientId] and [clientSecret] in order to get
   * an oauth token to auth to IGDB api. Optionally, provide a [logger] to
   * log all requests and responses
   * 
   * I use a factory pattern here because of the breaking changes in v4 of
   * IGDB API where auth is done via oauth (https://api-docs.igdb.com/#breaking-changes).
   * I wanted to ensure that any IGDBClient created is authenticated, so the 
   * creation must be async, ergo a factory method over a public constructor.
   */
  static Future<IGDBClient> create(String userAgent, String clientId,
    String clientSecret, {IGDBLogger logger}
  ) async {
    IGDBToken token = await _refreshToken(clientId, clientSecret);
    return IGDBClient._private(userAgent, clientId, clientSecret, token, logger: logger);
  }

  IGDBClient._private(this.userAgent, this.clientId, this.clientSecret, this.token, 
    {this.logger});

  static Future<IGDBToken> _refreshToken(String clientId, String clientSecret) async {
    String url = '$tokenUrl?client_id=$clientId&client_secret=$clientSecret&grant_type=client_credentials';
    var response = await post(url);
    
    if (response.statusCode != 200) {
      throw new Exception('Attempted to refresh token failed: (${response.statusCode}) ${response.body}');
    }

    Map responseMap = jsonDecode(response.body);
    return IGDBToken.fromMap(responseMap);
  }

  /**
   * Makes a POST request to the [url] with provided [body].
   * 
   * You generally shouldn't need to use this method directly, and instead
   * it's recommended to use [requestByPath] or the corresponding method
   * for the endpoint you're trying to reach.
   */
  Future<IGDBResponse> makeRequest(String url, String body) async {
    var uri = Uri.parse(url);

    var headers = {
      'Client-ID': clientId,
      'Authorization': 'Bearer ${token.accessToken}',
      'User-Agent': userAgent,
      'Accept': 'application/json'
    };

    var response = await post(url, headers: headers, body: body);

    // if we failed due to unauthorization, attempt to get a new token and
    // and try one more time
    if (response.statusCode == 401) {
      token = await _refreshToken(clientId, clientSecret);

      headers = {
        'Client-ID': clientId,
        'Authorization': 'Bearer ${token.accessToken}',
        'User-Agent': userAgent,
        'Accept': 'application/json'
      };

      response = await post(url, headers: headers, body: body);
    }

    if (logger != null) {
      logger.logRequest(uri.toString(), headers, body);
    }

    var error = null;
    var data = null;
    if (response.statusCode != 200) {
      error = json.decode(response.body);
    } else {
      data = json.decode(response.body);
    }

    var result = new IGDBResponse(response.statusCode, error, data);

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
    return await makeRequest(
        "${apiUrl}/${endpoint.toString()}", params.toBody());
  }

  Future<IGDBResponse> ageRatings(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.AGE_RATINGS, params);
  }

  Future<IGDBResponse> ageRatingContentDescriptions(
      IGDBRequestParameters params) async {
    return await _requestByEndpoint(
        IGDBEndpoints.AGE_RATING_CONTENT_DESCRIPTIONS, params);
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

  Future<IGDBResponse> externalGames(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.EXTERNAL_GAMES, params);
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
    return await _requestByEndpoint(
        IGDBEndpoints.GAME_VERSION_FEATURES, params);
  }

  Future<IGDBResponse> gameVersionFeatureValues(
      IGDBRequestParameters params) async {
    return await _requestByEndpoint(
        IGDBEndpoints.GAME_VERSION_FEATURE_VALUES, params);
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

  Future<IGDBResponse> platforms(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORMS, params);
  }

  Future<IGDBResponse> platformLogos(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_LOGOS, params);
  }

  Future<IGDBResponse> platformVersions(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_VERSIONS, params);
  }

  Future<IGDBResponse> platformVersionCompanies(
      IGDBRequestParameters params) async {
    return await _requestByEndpoint(
        IGDBEndpoints.PLATFORM_VERSION_COMPANIES, params);
  }

  Future<IGDBResponse> platformVersionReleaseDates(
      IGDBRequestParameters params) async {
    return await _requestByEndpoint(
        IGDBEndpoints.PLATFORM_VERSION_RELEASE_DATES, params);
  }

  Future<IGDBResponse> platformWebsites(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLATFORM_WEBSITES, params);
  }

  Future<IGDBResponse> playerPerspectives(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLAYER_PERSPECTIVES, params);
  }

  Future<IGDBResponse> releaseDates(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.RELEASE_DATES, params);
  }

  Future<IGDBResponse> search(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.SEARCH, params);
  }

  Future<IGDBResponse> themes(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.THEMES, params);
  }

  Future<IGDBResponse> websites(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.WEBSITES, params);
  }
}
