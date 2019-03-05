import 'package:igdb_client/igdb_client.dart';

import 'api_key.dart';

var client = new IGDBClient(
    MY_USER_AGENT,
    MY_API_KEY,
);

main() async {

  
  var gamesResponse = await client.games(IGDBRequestParameters(
    limit: 5,
    fields: ['name', 'rating', 'time_to_beat', 'release_dates'],
    order: 'rating desc',
  ));

  print(IGDBClient.getPrettyStringFromMap(gamesResponse.toMap()));

  

  // print(response.toPrettyString());
}

