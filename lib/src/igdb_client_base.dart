import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/enums/enums.dart';
import 'package:igdb_client/src/request_parameters.dart';

class IGDBClient {

  final String apiKey;
  final String userAgent;
  final String apiUrl = "https://api-v3.igdb.com";
  final bool printRequests;
  final bool printResponses;

  IGDBClient(this.userAgent, this.apiKey,
      {this.printRequests=false, this.printResponses=false}) {}

  logRequest(String text) {
    if (printRequests) {
      print('IGDBClient Request: $text');
    }
  }

  logResponse(String text) {
    if (printResponses) {
      print('IGDBClient Response: $text');
    }
  }

  Future<List<dynamic>> makeRequest(String url, String body) async {
    var uri = Uri.parse(url);
    var httpClient = new HttpClient();
    var request = await httpClient.postUrl(uri);
    request..headers.add('user-key', apiKey)
      ..headers.add('User-Agent', userAgent)
      ..headers.add('Accept', 'application/json')
      ..write(body);

    logRequest('$uri\n$body');

    var resp = await request.close();
    var responseBody = await resp.transform(utf8.decoder).join();

    logResponse(responseBody);

    List<dynamic> data = json.decode(responseBody);
    return data;
  }

  Future<List<dynamic>> requestByEndpoint(IGDBEndpoints endpoint, IGDBRequestParameters params) async {
    return await makeRequest("${apiUrl}/${endpoint.toString()}", params.toBody());
  }

  Future<List<dynamic>> characters(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.CHARACTERS, params);
  }

  Future<List<dynamic>> collections(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.COLLECTIONS, params);
  }

  Future<List<dynamic>> companies(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.COMPANIES, params);
  }

  Future<List<dynamic>> credits(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.CREDITS, params);
  }

  Future<List<dynamic>> feeds(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.FEEDS, params);
  }

  Future<List<dynamic>> franchises(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.FRANCHISES, params);
  }

  Future<List<dynamic>> gameEngines(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GAME_ENGINES, params);
  }

  Future<List<dynamic>> gameModes(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GAME_MODES, params);
  }

  Future<List<dynamic>> games(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GAMES, params);
  }

  Future<List<dynamic>> genres(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.GENRES, params);
  }

  Future<List<dynamic>> keywords(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.KEYWORDS, params);
  }

  Future<List<dynamic>> pages(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PAGES, params);
  }

  Future<List<dynamic>> people(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PEOPLE, params);
  }

  Future<List<dynamic>> platforms(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PLATFORMS, params);
  }

  Future<List<dynamic>> playerPerspectives(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PLAYER_PERSPECTIVES, params);
  }

  Future<List<dynamic>> pulseGroups(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PULSE_GROUPS, params);
  }

  Future<List<dynamic>> pulseSources(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PULSE_SOURCES, params);
  }

  Future<List<dynamic>> pulses(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.PULSES, params);
  }

  Future<List<dynamic>> releaseDates(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.RELEASE_DATES, params);
  }

  Future<List<dynamic>> reviews(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.REVIEWS, params);
  }

  Future<List<dynamic>> search(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.SEARCH, params);
  }

  Future<List<dynamic>> themes(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.THEMES, params);
  }

  Future<List<dynamic>> titles(IGDBRequestParameters params) async {
    return await requestByEndpoint(IGDBEndpoints.TITLES, params);
  }

  static String getImageUrl(String imageId, IGDBImageSizes size,
      {bool isRetina=false}) {
    String sizeStr = isRetina ? '${size.name}_2x' : '${size.name}';
    return 'https://images.igdb.com/igdb/image/upload/t_${sizeStr}/${imageId}.jpg';
  }
}
