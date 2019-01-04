
class IGDBImageSizes {
  final String name;
  final int width;
  final int height;
  const IGDBImageSizes._private(this.name, this.width, this.height);

  static const IGDBImageSizes COVER_SMALL = const IGDBImageSizes._private('cover_small', 90, 28);
  static const IGDBImageSizes SCREENSHOT_MED = const IGDBImageSizes._private('screenshot_med', 569, 320);
  static const IGDBImageSizes COVER_BIG = const IGDBImageSizes._private('cover_big', 227, 320);
  static const IGDBImageSizes LOGO_MED = const IGDBImageSizes._private('logo_med', 284, 160);
  static const IGDBImageSizes SCREENSHOT_BIG = const IGDBImageSizes._private('screenshot_big', 889, 500);
  static const IGDBImageSizes SCREENSHOT_HUGE = const IGDBImageSizes._private('screenshot_huge', 1280, 720);
  static const IGDBImageSizes THUMB = const IGDBImageSizes._private('thumb', 90, 90);
  static const IGDBImageSizes MICRO = const IGDBImageSizes._private('micro', 35, 35);
  static const IGDBImageSizes HD720P = const IGDBImageSizes._private('720p', 1280, 720);
  static const IGDBImageSizes HD1080P = const IGDBImageSizes._private('1080p', 1920, 1080);
}