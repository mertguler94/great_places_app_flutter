// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class LocationHelper {
  static String generateLocationPreviewImage(
    double latitude,
    double longitude,
  ) {
    final API_KEY = FlutterConfig.get('MAP_API_KEY');
    return 'https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=400&center=lonlat:$longitude,$latitude&zoom=17&marker=lonlat:$longitude,$latitude;type:material;color:%23ff3421;icontype:awesome&apiKey=$API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final API_KEY = FlutterConfig.get('GOOGLE_MAPS_API_KEY');
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$API_KEY');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
