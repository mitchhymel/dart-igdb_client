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
   * an [IDGBEndpoints] enum for it (e.g. achievements).
   */
  Future<IGDBResponse> requestByPath(
    String path, IGDBRequestParameters params) async {
    return await makeRequest("${apiUrl}/$path", params.toBody());
  }

  Future<IGDBResponse> _requestByEndpoint(
    IGDBEndpoints endpoint, IGDBRequestParameters params) async {
    return await makeRequest("${apiUrl}/${endpoint.toString()}", params.toBody());
  }

  Future<IGDBResponse> characters(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.CHARACTERS, params);
  }

  Future<IGDBResponse> collections(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COLLECTIONS, params);
  }

  Future<IGDBResponse> companies(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COMPANIES, params);
  }

  Future<IGDBResponse> covers(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.COVERS, params);
  }

  Future<IGDBResponse> credits(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.CREDITS, params);
  }

  Future<IGDBResponse> feeds(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.FEEDS, params);
  }

  Future<IGDBResponse> franchises(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.FRANCHISES, params);
  }

  Future<IGDBResponse> gameEngines(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_ENGINES, params);
  }

  Future<IGDBResponse> gameModes(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_MODES, params);
  }

  Future<IGDBResponse> gameVideos(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAME_VIDEOS, params);
  }

  Future<IGDBResponse> games(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GAMES, params);
  }

  Future<IGDBResponse> genres(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.GENRES, params);
  }

  Future<IGDBResponse> keywords(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.KEYWORDS, params);
  }

  Future<IGDBResponse> pages(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PAGES, params);
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

  Future<IGDBResponse> playerPerspectives(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PLAYER_PERSPECTIVES, params);
  }

  Future<IGDBResponse> pulseGroups(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PULSE_GROUPS, params);
  }

  Future<IGDBResponse> pulseSources(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PULSE_SOURCES, params);
  }

  Future<IGDBResponse> pulses(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.PULSES, params);
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

  Future<IGDBResponse> titles(IGDBRequestParameters params) async {
    return await _requestByEndpoint(IGDBEndpoints.TITLES, params);
  }

  /**
   * Helper method to get the igdb url to show an image provided
   * its [imageId] and [size].
   * Provide [isRetina] if you want to double the image resolution and
   * [alphaChannel] if you know the image has an alpha in it (avoiding black background, for example).
   */
  static String getImageUrl(String imageId, IGDBImageSizes size,
      {bool isRetina=false, bool alphaChannel=false}) {
    String sizeStr = isRetina ? '${size.name}_2x' : '${size.name}';
    String fileExtension = alphaChannel ? 'png' : 'jpg';
    return 'https://images.igdb.com/igdb/image/upload/t_${sizeStr}/${imageId}.$fileExtension';
  }

  /**
   * Helper method to print a map as json formatted with tabs
   */
  static String getPrettyStringFromMap(Map map) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    return encoder.convert(map);
  }
}
