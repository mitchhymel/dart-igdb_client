import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:igdb_client/src/models.dart';
import 'package:igdb_client/src/igdb_client_base.dart';

class IGDBClientTyped extends IGDBClient {

  IGDBClientTyped(String userAgent, String apiUrl, String apiKey)
      : super(userAgent, apiUrl, apiKey)
  {}

  @override
  Future<List<Game>> games(RequestParameters params) async {
    List<dynamic> result = await requestByEndpoint(Endpoints.GAMES, params);
    return Game.listFromMapList(result);
  }

  @override
  Future<List<ReleaseDate>> releaseDates(RequestParameters params, {bool expandGame=false}) async {
    List<dynamic> result = await requestByEndpoint(Endpoints.RELEASE_DATES, params);
    return ReleaseDate.listFromMapList(result, expandGame: expandGame);
  }
}
