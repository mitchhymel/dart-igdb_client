import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/models/models.dart';
import 'package:igdb_client/src/endpoints.dart';

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

  String _buildRequestUrl(String endpoint, IGDBRequestParameters params) {
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

    String query = (params.ids == null ? '' : params.ids.join(''))
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

  Future<List> requestByEndpoint(Endpoint endpoint, IGDBRequestParameters params) async {
    String url = _buildRequestUrl(endpoint.value, params);
    print(url);
    return await _makeRequest(url);
  }

  Future<List> characters(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.CHARACTERS, params);
  }

  Future<List> collections(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.COLLECTIONS, params);
  }

  Future<List> companies(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.COMPANIES, params);
  }

  Future<List> credits(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.CREDITS, params);
  }

  Future<List> feeds(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.FEEDS, params);
  }

  Future<List> franchises(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.FRANCHISES, params);
  }

  Future<List> gameEngines(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.GAME_ENGINES, params);
  }

  Future<List> gameModes(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.GAME_MODES, params);
  }

  Future<List> games(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.GAMES, params);
  }

  Future<List> genres(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.GENRES, params);
  }

  Future<List> keywords(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.KEYWORDS, params);
  }

  Future<List> pages(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.PAGES, params);
  }

  Future<List> people(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.PEOPLE, params);
  }

  Future<List> platforms(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.PLATFORMS, params);
  }

  Future<List> playerPerspectives(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.PLAYER_PERSPECTIVES, params);
  }

  Future<List> pulseGroups(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.PULSE_GROUPS, params);
  }

  Future<List> pulseSources(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.PULSE_SOURCES, params);
  }

  Future<List> pulses(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.PULSES, params);
  }

  Future<List> releaseDates(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.RELEASE_DATES, params);
  }

  Future<List> reviews(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.REVIEWS, params);
  }

  Future<List> themes(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.THEMES, params);
  }

  Future<List> titles(IGDBRequestParameters params) async {
    return await requestByEndpoint(Endpoint.TITLES, params);
  }
}
