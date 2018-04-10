
export 'models/request_parameters.dart';
export 'models/genre.dart';
export 'models/platform.dart';
export 'models/filter.dart';
export 'models/region.dart';
export 'models/release_date.dart';
export 'models/endpoint.dart';
export 'models/game.dart';
export 'models/image.dart';
export 'models/video.dart';

DateTime dateTimeFromMsecSinceEpoch(int value) {
  if (value == null) {
    // error?
    return new DateTime.now();
  }
  return new DateTime.fromMillisecondsSinceEpoch(value, isUtc: true);
}
