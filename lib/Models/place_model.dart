import 'dart:io';
import 'package:flutter_forum/Models/location_model.dart';

class PlaceModel {
  final int id;
  final String userName;
  final String title;
  final String description;
  final String imageUrl;
  final LocationModel location;

  const PlaceModel({
    required this.id,
    required this.userName,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
  });
}