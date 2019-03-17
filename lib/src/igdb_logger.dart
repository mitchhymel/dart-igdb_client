import 'dart:io';
import 'package:igdb_client/src/igdb_helpers.dart';
import 'package:igdb_client/src/igdb_response.dart';

/**
 * Class used in [IGDBClient] to allow hooks to log requests and responses.
 * 
 * See [IGDBConsoleLogger] below as an example on how to implement.
 */
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
    print(IGDBHelpers.getPrettyStringFromMap(map));
  }

  @override
  void logResponse(IGDBResponse response) {
    print('IGDBClient Response:');
    print(IGDBHelpers.getPrettyStringFromMap(response.toMap()));
  }
}