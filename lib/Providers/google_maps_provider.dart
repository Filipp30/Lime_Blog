import 'dart:convert';
import 'package:http/http.dart' as http;
const GOOGLE_API_KEY = 'AIzaSyAMlXpWhxBTTYiGw0hepv7kYvUzb0YnKXQ';

class GoogleMapsProvider{

  static String generateLocationPreviewImage({required double latitude, required double longitude}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = Uri.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY");
    final response = await http.get(url);
    final String country = json.decode(response.body)['results'][0]['address_components'][5]['long_name'].toString();
    final String state = json.decode(response.body)['results'][0]['address_components'][4]['long_name'].toString();
    return country+'  '+state;
  }
}