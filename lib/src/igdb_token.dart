import 'dart:convert';

class IGDBToken {

  final String accessToken;
  final int expiresIn;
  final String tokenType;

  IGDBToken({this.accessToken, this.expiresIn, this.tokenType});

  @override
  String toString() => jsonEncode(toMap());
  Map toMap() => {
    'access_token': accessToken,
    'expires_in': expiresIn,
    'token_type': tokenType
  };

  static IGDBToken fromMap(Map map) => new IGDBToken(
    accessToken: map['access_token'],
    expiresIn: map['expires_in'],
    tokenType: map['token_type']
  );
}