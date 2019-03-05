import 'dart:convert';

class IGDBResponse {
  final int status;
  final dynamic error;
  final List<dynamic> data;

  IGDBResponse(this.status, this.error, this.data);

  bool isSuccess() {
    return this.status == 200 && this.error == null;
  }

  Map toMap() {
    return {
      'status': status,
      'error': error,
      'data': data
    };
  }

  String toString() {
    return this.toJson();
  }

  String toJson() {
    return json.encode(this.toMap());
  }
}