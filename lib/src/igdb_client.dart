import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/enums/enums.dart';
import 'package:igdb_client/src/request_parameters.dart';
import 'package:igdb_client/src/igdb_response.dart';
import 'package:igdb_client/src/igdb_logger.dart';

class IGDBClient {

  final String apiKey;
  final String userAgent;
  final String apiUrl = "https://api-v3.igdb.com";
  final IGDBLogger logger;

  IGDBClient(this.userAgent, this.apiKey,
      {this.logger}) {}

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

  Future<IGDBResponse> requestByPath(
    String path, IGDBRequestParameters params) async {
    return await makeRequest("${apiUrl}/$path", params.toBody());
  }

  Future<IGDBResponse> requestByEndpoint(
    IGDBEndpoints endpoint, IGDBRequestParameters params) async {
    return await makeRequest("${apiUrl}/${endpoint.toString()}", params.toBody());
  }

  Future<IGDBResponse> characters(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.CHARACTERS, params);
  }

  Future<IGDBResponse> collections(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.COLLECTIONS, params);
  }

  Future<IGDBResponse> companies(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.COMPANIES, params);
  }

  Future<IGDBResponse> credits(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.CREDITS, params);
  }

  Future<IGDBResponse> feeds(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.FEEDS, params);
  }

  Future<IGDBResponse> franchises(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.FRANCHISES, params);
  }

  Future<IGDBResponse> gameEngines(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GAME_ENGINES, params);
  }

  Future<IGDBResponse> gameModes(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GAME_MODES, params);
  }

  Future<IGDBResponse> games(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GAMES, params);
  }

  Future<IGDBResponse> genres(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GENRES, params);
  }

  Future<IGDBResponse> keywords(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.KEYWORDS, params);
  }

  Future<IGDBResponse> pages(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PAGES, params);
  }

  Future<IGDBResponse> people(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PEOPLE, params);
  }

  Future<IGDBResponse> platforms(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PLATFORMS, params);
  }

  Future<IGDBResponse> playerPerspectives(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PLAYER_PERSPECTIVES, params);
  }

  Future<IGDBResponse> pulseGroups(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PULSE_GROUPS, params);
  }

  Future<IGDBResponse> pulseSources(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PULSE_SOURCES, params);
  }

  Future<IGDBResponse> pulses(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PULSES, params);
  }

  Future<IGDBResponse> releaseDates(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.RELEASE_DATES, params);
  }

  Future<IGDBResponse> reviews(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.REVIEWS, params);
  }

  Future<IGDBResponse> search(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.SEARCH, params);
  }

  Future<IGDBResponse> themes(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.THEMES, params);
  }

  Future<IGDBResponse> titles(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.TITLES, params);
  }

  static String getImageUrl(String imageId, IGDBImageSizes size,
      {bool isRetina=false}) {
    String sizeStr = isRetina ? '${size.name}_2x' : '${size.name}';
    return 'https://images.igdb.com/igdb/image/upload/t_${sizeStr}/${imageId}.jpg';
  }

  static String getPrettyStringFromMap(Map map) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    return encoder.convert(map);
  }
}
