import 'dart:io';
import 'package:flutter_forum/Models/location_model.dart';

class PlaceModel {
  final String id;
  final String userName;
  final String title;
  final String description;
  final File image;
  final LocationModel location;

  const PlaceModel({
    required this.id,
    required this.userName,
    required this.title,
    required this.description,
    required this.image,
    required this.location,
  });
}