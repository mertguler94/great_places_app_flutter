// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationHelper {
  static String generateLocationPreviewImage(
    double latitude,
    double longitude,
  ) {
    final API_KEY = dotenv.env['GEOCODING_API_KEY'];
    return 'https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=400&center=lonlat:$longitude,$latitude&zoom=17&marker=lonlat:$longitude,$latitude;type:material;color:%23ff3421;icontype:awesome&apiKey=$API_KEY';
  }
}
