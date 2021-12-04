
import 'dart:async';

import 'package:flutter_forum/DataBase/dummy_data.dart';
import 'package:flutter_forum/Models/place_model.dart';

class DataBaseService{

  static Future<List<PlaceModel>> getPlaces() async{
    await Future.delayed(const Duration(seconds: 1), () {});
    return PLACES;
  }

}