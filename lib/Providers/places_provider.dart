import 'package:flutter/material.dart';
import 'package:flutter_forum/Models/location_model.dart';
import 'package:flutter_forum/Models/place_model.dart';
import 'package:flutter_forum/Services/data_base_service.dart';

class PlacesProvider with ChangeNotifier {

  List<PlaceModel> _placesList = [];

  List<PlaceModel> get placesList {
    return [..._placesList];
  }

  Future<void> getAllPlaces() async {
    final dataList = await DataBaseService.getPlaces();

    _placesList = dataList.map((item) => PlaceModel(
        id: item['id'],
        userName: item['user_name'],
        title: item['title'],
        description: item['description'],
        imageUrl: item['image_url'],
        locationName: item['location_name']
    )).toList();
    notifyListeners();
  }

  Future<bool> addBlogPlace(String title, String description, LocationModel locationData) async {
    var response = await DataBaseService.addPlace(title, description, locationData);
    if (response == 200) {
       getAllPlaces();
       return true;
    }else{
      return false;
    }
  }
}