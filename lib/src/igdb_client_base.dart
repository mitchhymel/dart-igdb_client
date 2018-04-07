import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/models.dart';

class IGDBClient {

  final String _apiKey;
  final String _userAgent;
  final String _apiUrl;

  IGDBClient(this._userAgent, this._apiUrl, this._apiKey) {}

  Future<List<dynamic>> _makeRequest(String url) async {
    var uri = Uri.parse(url);
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    request..headers.add('user-key', _apiKey)
      ..headers.add('User-Agent', _userAgent)
      ..headers.add('Accept', 'application/json');
    var resp = await request.close();
    var responseBody = await resp.transform(UTF8.decoder).join();
    List<dynamic> data = json.decode(responseBody);
    return data;
  }

  String _buildRequestUrl(String endpoint, RequestParameters params) {
    String filtersString;
    if (params.filters != null) {
      List<String> urlEncodedFilters = new List<String>();
      params.filters.forEach((filter) {
        String result = '&filter' + Uri.encodeQueryComponent(filter.toString());
        result = result.replaceAll('%3D', '=');
        urlEncodedFilters.add(result);
      });

      filtersString = urlEncodedFilters.join('');
    }

    String query = (params.ids == null ? '' : params.ids.join(','))
        + (params.search == null ? '?' : '?search=${Uri.encodeFull(params.search)}&')
        + (params.fields == null ? 'fields=*' : 'fields=' + params.fields.join(','))
        + (params.filters == null ? '' : filtersString)
        + (params.expand == null ? '' : '&expand=' + params.expand)
        + (params.order == null ? '' : '&order=' + params.order)
        + (params.limit == null ? '' : '&limit=' + params.limit.toString())
        + (params.offset == null ? '' : '&offset=' + params.offset.toString())
        + (params.scroll == null ? '' : '&scroll=' + params.scroll.toString());

    return '$_apiUrl/$endpoint/$query';
    // return query;
  }

  Future<List<dynamic>> requestByEndpoint(Endpoints endpoint, RequestParameters params) async {
    String url = _buildRequestUrl(endpoint.value, params);
    print(url);
    return await _makeRequest(url);
  }

  Future<List<dynamic>> characters(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.CHARACTERS, params);
  }

  Future<List<dynamic>> collections(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.COLLECTIONS, params);
  }

  Future<List<dynamic>> companies(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.COMPANIES, params);
  }

  Future<List<dynamic>> credits(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.CREDITS, params);
  }

  Future<List<dynamic>> feeds(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.FEEDS, params);
  }

  Future<List<dynamic>> franchises(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.FRANCHISES, params);
  }

  Future<List<dynamic>> gameEngines(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GAME_ENGINES, params);
  }

  Future<List<dynamic>> gameModes(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GAME_MODES, params);
  }

  Future<List<dynamic>> games(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GAMES, params);
  }

  Future<List<dynamic>> genres(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GENRES, params);
  }

  Future<List<dynamic>> keywords(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.KEYWORDS, params);
  }

  Future<List<dynamic>> pages(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PAGES, params);
  }

  Future<List<dynamic>> people(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PEOPLE, params);
  }

  Future<List<dynamic>> platforms(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PLATFORMS, params);
  }

  Future<List<dynamic>> playerPerspectives(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PLAYER_PERSPECTIVES, params);
  }

  Future<List<dynamic>> pulseGroups(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PULSE_GROUPS, params);
  }

  Future<List<dynamic>> pulseSources(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PULSE_SOURCES, params);
  }

  Future<List<dynamic>> pulses(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PULSES, params);
  }

  Future<List<dynamic>> releaseDates(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.RELEASE_DATES, params);
  }

  Future<List<dynamic>> reviews(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.REVIEWS, params);
  }

  Future<List<dynamic>> themes(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.THEMES, params);
  }

  Future<List<dynamic>> titles(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.TITLES, params);
  }
}
