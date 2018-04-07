import 'package:igdb_client/igdb_client.dart';
import 'dart:convert';

import 'api_key.dart';

main() async {
  print ('hello world');

  var _igdbClient = new IGDBClient(
      MY_USER_AGENT,
      IGDB_API_URL,
      MY_API_KEY
  );

  List games = await _igdbClient.games(new RequestParameters(
    limit: 3
  ));

  prettyPrint(games[0]);

  List genres = await _igdbClient.genres(new RequestParameters(
    limit: 3,
  ));

  prettyPrint(genres[0]);
}

prettyPrint(Map obj) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  print(encoder.convert(obj));
}
