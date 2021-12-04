import 'package:flutter/material.dart';
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
        id: item.id,
        userName: item.userName,
        title: item.title,
        description: item.description,
        imageUrl: item.imageUrl,
        location: item.location
    )).toList();
    notifyListeners();
  }

  void addPlace(){

  }
}