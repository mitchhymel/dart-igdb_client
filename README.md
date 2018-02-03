# igdb_client

A Dart library for using the IGDB.com API
https://igdb.github.io/api/about/welcome/


Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

    import 'package:igdb_client/igdb_client.dart';

    var _igdbClient = new IGDBClient(
      'your_user_agent',
      'igdb_api_url',
      'your_igdb_api_key'
    );

    List games = await _igdbClient.games(new IGDBRequestParameters(
      limit: 3
    ));

