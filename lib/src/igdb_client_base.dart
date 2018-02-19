import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/models.dart';

class IGDBClient {

  final String _apiKey;
  final String _userAgent;
  final String _apiUrl;

  IGDBClient(this._userAgent, this._apiUrl, this._apiKey) {}

  Future<List> _makeRequest(String url) async {
    var uri = Uri.parse(url);
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    request..headers.add('user-key', _apiKey)
      ..headers.add('User-Agent', _userAgent)
      ..headers.add('Accept', 'application/json');
    var resp = await request.close();
    var responseBody = await resp.transform(UTF8.decoder).join();
    List data = JSON.decode(responseBody);
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

  Future<List> requestByEndpoint(Endpoints endpoint, RequestParameters params) async {
    String url = _buildRequestUrl(endpoint.value, params);
    print(url);
    return await _makeRequest(url);
  }

  Future<List> characters(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.CHARACTERS, params);
  }

  Future<List> collections(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.COLLECTIONS, params);
  }

  Future<List> companies(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.COMPANIES, params);
  }

  Future<List> credits(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.CREDITS, params);
  }

  Future<List> feeds(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.FEEDS, params);
  }

  Future<List> franchises(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.FRANCHISES, params);
  }

  Future<List> gameEngines(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GAME_ENGINES, params);
  }

  Future<List> gameModes(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GAME_MODES, params);
  }

  Future<List> games(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GAMES, params);
  }

  Future<List> genres(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.GENRES, params);
  }

  Future<List> keywords(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.KEYWORDS, params);
  }

  Future<List> pages(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PAGES, params);
  }

  Future<List> people(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PEOPLE, params);
  }

  Future<List> platforms(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PLATFORMS, params);
  }

  Future<List> playerPerspectives(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PLAYER_PERSPECTIVES, params);
  }

  Future<List> pulseGroups(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PULSE_GROUPS, params);
  }

  Future<List> pulseSources(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PULSE_SOURCES, params);
  }

  Future<List> pulses(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.PULSES, params);
  }

  Future<List> releaseDates(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.RELEASE_DATES, params);
  }

  Future<List> reviews(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.REVIEWS, params);
  }

  Future<List> themes(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.THEMES, params);
  }

  Future<List> titles(RequestParameters params) async {
    return await requestByEndpoint(Endpoints.TITLES, params);
  }
}
