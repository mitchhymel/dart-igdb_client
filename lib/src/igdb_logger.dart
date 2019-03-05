import 'dart:io';
import 'package:igdb_client/src/igdb_client.dart';
import 'package:igdb_client/src/igdb_response.dart';

abstract class IGDBLogger {
  void logRequest(HttpClientRequest request, String body);
  void logResponse(IGDBResponse response);
} 

class IGDBConsoleLogger implements IGDBLogger {
  @override
  void logRequest(HttpClientRequest request, String body) {
    Map headerMap = {};
    request.headers.forEach((s, l) => headerMap[s] = l);

    Map map = {
      'method': request.method,
      'uri': request.uri.toString(),
      'headers': headerMap,
      'body': body
    };

    print('IGDBClient Request:');
    print(IGDBClient.getPrettyStringFromMap(map));
  }

  @override
  void logResponse(IGDBResponse response) {
    print('IGDBClient Response:');
    print(IGDBClient.getPrettyStringFromMap(response.toMap()));
  }
}