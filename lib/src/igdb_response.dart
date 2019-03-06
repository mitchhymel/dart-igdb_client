import 'dart:convert';

class IGDBResponse {

  /** 
   * Http status code of the request
   */
  final int status;

  /**
   * Object containing error information about the request. Will be null if
   * the request was successful.
   */
  final dynamic error;

  /**
   * Object containing the resulting objects returned from IGDB's API. Will 
   * be null if the request encountered an error.
   */
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