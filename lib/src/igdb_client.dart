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
  final String userAgent;
  final IGDBLogger logger;
  
  final String token;
  static const String tokenUrl = 'https://id.twitch.tv/oauth2/token';

  static const apiUrl = 'https://api.igdb.com/v4';

  /**
   * Constructor for IGDBClient. Requires a [userAgent] to be sent with
   * every request to identify the request. Requires your twitch develeoper
   * [clientId] and an oauth [token] obtained from twitch or via
   * [getOauthToken]. Optionally, provide a [logger] to log every request
   * and response
   */
  IGDBClient(this.userAgent, this.clientId, this.token, {this.logger});

  /**
   * Static helper method to get an oauthToken from the provided Twitch developer [clientId] and
   * [clientSecret]. This should be called once, you should save the token
   * somewhere, then use that to instantiate IGDBClient. These expire after
   * ~60 days, so if you are using IGDBClient and get 401 errors, you should
   * refresh your token and reinstantiate IGDBClient.
   * 
   * See full documentation at igdb https://api-docs.igdb.com/#breaking-changes
   * or twitch https://dev.twitch.tv/docs/authentication.
   */
  static Future<IGDBToken> getOauthToken(String clientId, String clientSecret) async {
    String url = '$tokenUrl?client_id=$clientId&client_secret=$clientSecret&grant_type=client_credentials';
    var response = await post(url);
    
    if (response.statusCode != 200) {
      throw new Exception('Attempted to get oauth token failed: (${response.statusCode}) ${response.body}');
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
      'Authorization': 'Bearer ${token}',
      'User-Agent': userAgent,
      'Accept': 'application/json'
    };

    if (logger != null) {
      logger.logRequest(uri.toString(), headers, body);
    }

    var response = await post(url, headers: headers, body: body);

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
