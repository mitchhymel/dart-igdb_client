# igdb_client

A Dart library for using the IGDB.com API v3
https://api-docs.igdb.com/

It is highly recommended to read through the IGDB documentation to understand
what exactly you can do with the API.

## Limitations
Premium features (including [IGDB user authentication](https://api-docs.igdb.com/#igdb-authentication)) are not supported and I don't currently have plans to add support for them as I don't have access to these.

## Usage

To start using this, just add it to your pubspec:

[![pub package](https://img.shields.io/pub/v/igdb_client.svg)](https://pub.dartlang.org/packages/igdb_client)


See example/igdb_client_example.dart for a more in depth example of some
of the things you can do with this client. Otherwise a simple example can be
found below.

    import 'package:igdb_client/igdb_client.dart';

    var client = new IGDBClient(
      'your_user_agent',
      'your_api_key',
    );

    var gamesResponse = await client.games(new IGDBRequestParameters(
      limit: 3
    ));

    print(IGDBClient.getPrettyStringFromMap(gamesResponse.toMap()));

    if (gamesResponse.isSuccess()) {
      // do something with gamesResponse.data
    }
    else {
      // do something depending on gamesResponse.error
    }

