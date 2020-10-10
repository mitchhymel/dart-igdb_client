# igdb_client

A Dart library for using the IGDB.com API v4
https://api-docs.igdb.com/

It is highly recommended to read through the IGDB documentation to understand
what exactly you can do with the API.

## Usage in Web and Mobile Applications

From the [IGDB documentation on Web and Mobile applications](https://api-docs.igdb.com/#web-and-mobile-applications)

> What?
> 
> The IGDB V4 API uses Oauth App Tokens, which aren’t suitable for mobile or frontend-only applications:
>    * There is a limit of roughly 25 app tokens active at any time
>    * Tokens expire after roughly 60 days.
> To help transition to V4, we are providing a quick way to setup a proxy for mobile applications.
> 
> How?
> 
> Please follow our [proxy](https://api-docs.igdb.com/#proxy) guide!!


## Usage

To start using this, just add it to your pubspec:

[![pub package](https://img.shields.io/pub/v/igdb_client.svg)](https://pub.dartlang.org/packages/igdb_client)


See example/igdb_client_example.dart for a more in depth example of some
of the things you can do with this client. Otherwise a simple example can be
found below.

    import 'package:igdb_client/igdb_client.dart';

    var client = await IGDBClient.create(MY_USER_AGENT, MY_CLIENT_ID, MY_CLIENT_SECRET);

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

