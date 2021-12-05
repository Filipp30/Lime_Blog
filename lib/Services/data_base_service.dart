
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_forum/DataBase/dummy_data.dart';
import 'package:flutter_forum/Models/add_place_to_db_model.dart';
import 'package:flutter_forum/Models/location_model.dart';
import 'package:flutter_forum/Models/place_model.dart';
import 'package:flutter_forum/Providers/google_maps_provider.dart';

class DataBaseService{

  static Future<List<PlaceModel>> getPlaces() async{
    await Future.delayed(const Duration(seconds: 1), () {});
    return PLACES;
  }

  static Future<void> addPlace(String title,String description,LocationModel location) async{
    final locationName = await GoogleMapsProvider.getPlaceAddress(location.latitude, location.longitude);
    final dbModel = AddPlaceToDbModel(title: title, description: description, locationName: locationName);
  }

}