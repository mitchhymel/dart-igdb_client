
class ImageSizes {
  final String name;
  final int width;
  final int height;
  const ImageSizes._private(this.name, this.width, this.height);

  static const ImageSizes COVER_SMALL = const ImageSizes._private('cover_small', 90, 28);
  static const ImageSizes SCREENSHOT_MED = const ImageSizes._private('screenshot_med', 569, 320);
  static const ImageSizes COVER_BIG = const ImageSizes._private('cover_big', 227, 320);
  static const ImageSizes LOGO_MED = const ImageSizes._private('logo_med', 284, 160);
  static const ImageSizes SCREENSHOT_BIG = const ImageSizes._private('screenshot_big', 889, 500);
  static const ImageSizes SCREENSHOT_HUGE = const ImageSizes._private('screenshot_huge', 1280, 720);
  static const ImageSizes THUMB = const ImageSizes._private('thumb', 90, 90);
  static const ImageSizes MICRO = const ImageSizes._private('micro', 35, 35);
  static const ImageSizes HD720P = const ImageSizes._private('720p', 1280, 720);
  static const ImageSizes HD1080P = const ImageSizes._private('1080p', 1920, 1080);
}

class Image {
  final String url;
  final String cloudinaryId;
  final int width;
  final int height;

  Image({
    this.url,
    this.cloudinaryId,
    this.width,
    this.height
  });

  static Image fromMap(Map map) {
    if (map == null) {
      return null;
    }

    return new Image(
      url: map['url'],
      cloudinaryId: map['cloudinary_id'],
      width: map['width'],
      height: map['height']
    );
  }

  static List<Image> listFromMapList(List<Map> maps) {
    if (maps != null) {
      return maps.map((map) => fromMap(map)).toList();
    }

    return new List<Image>();
  }

  String getImageUrl(ImageSizes size, {bool isRetina=false}) {
    String sizeStr = isRetina ? '${size.name}_2x' : '${size.name}';
    return 'https://images.igdb.com/igdb/image/upload/t_${sizeStr}/${cloudinaryId}.jpg';
  }
}