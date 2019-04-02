import 'dart:convert';
import 'package:igdb_client/src/enums/enums.dart';

class IGDBHelpers {
  /**
   * Helper method to get the igdb url to show an image provided
   * its [imageId] and [size].
   * Provide [isRetina] if you want to double the image resolution and
   * [alphaChannel] if you know the image has an alpha in it (avoiding black background, for example).
   */
  static String getImageUrl(String imageId, IGDBImageSizes size,
      {bool isRetina=false, bool alphaChannel=false}) {
    String sizeStr = isRetina ? '${size.name}_2x' : '${size.name}';
    String fileExtension = alphaChannel ? 'png' : 'jpg';
    return 'https://images.igdb.com/igdb/image/upload/t_${sizeStr}/${imageId}.$fileExtension';
  }

  /**
   * Helper method to print a map as json formatted with tabs
   */
  static String getPrettyStringFromMap(Map map) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    return encoder.convert(map);
  }
}