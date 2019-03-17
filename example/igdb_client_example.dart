import 'api_key.dart';

import 'package:igdb_client/igdb_client.dart';

var client = new IGDBClient(
    MY_USER_AGENT,
    MY_API_KEY,
);

main() async {

  // Find games with 'infamous' in their name and return
  // the results' name and expand their release_dates and platforms.
  var gamesResponse = await client.games(new IGDBRequestParameters(
    search: 'infamous',
    fields: ['name', 'release_dates.*', 'platforms.*']
  ));
  printResponse(gamesResponse);

  // Find games that are not yet released but are releasing soon in the
  // North American, Worlwide, or Unspecified regions, then sort by 
  // release date.
  int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  int secsSinceEpoch = msecSinceEpoch~/1000;
  String timeNow = secsSinceEpoch.toString();
  var releaseResponse = await client.releaseDates(new IGDBRequestParameters(
    filters: 'date > $timeNow & (region = ${IGDBRegions.NORTH_AMERICA.id} | region = ${IGDBRegions.NONE.id} | region = ${IGDBRegions.WORLDWIDE.id})',
    order: 'date asc'
  ));
  printResponse(releaseResponse);

  var gameIdResponse = await client.games(new IGDBRequestParameters(
    ids: [43378],
  ));
  printResponse(gameIdResponse);
}

printResponse(IGDBResponse resp) {
  print(IGDBHelpers.getPrettyStringFromMap(resp.toMap()));
}

