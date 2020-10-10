import 'api_key.dart';

import 'package:igdb_client/igdb_client.dart';


main() async {

  // You should only run this once, then save it somewhere. It will eventually
  // expire after ~60 days, at which point you will need to getOauthToken again
  // 
  // The reason for this is that there is a limit of roughly 25 app tokens
  // active at any time. See https://api-docs.igdb.com/#web-and-mobile-applications
  var token = await IGDBClient.getOauthToken(MY_CLIENT_ID, MY_CLIENT_SECRET);

  var client = new IGDBClient(MY_USER_AGENT, MY_CLIENT_ID, token.accessToken, logger: IGDBConsoleLogger());

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

