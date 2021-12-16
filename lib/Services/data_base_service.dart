
import 'dart:async';
import 'dart:convert';
import 'package:flutter_forum/Models/add_place_to_db_model.dart';
import 'package:flutter_forum/Models/comment_model.dart';
import 'package:flutter_forum/Models/location_model.dart';
import 'package:flutter_forum/Models/user_model.dart';
import 'package:flutter_forum/Providers/google_maps_provider.dart';
import 'package:http/http.dart' as http;

class DataBaseService{

  static const _publicBackEndApi = "https://18f1-81-11-211-133.ngrok.io";

  static Future<List<dynamic>> getPlaces() async{
    var url = Uri.parse(_publicBackEndApi+'/api/all-blog-posts');
    var client = http.Client();
    try {
      var response = await client.get(url);
      return json.decode(response.body);
    } finally {
      client.close();
    }
  }

  static Future<int> addPlace(String title,String description,LocationModel location) async{
    final locationName = await GoogleMapsProvider.getPlaceAddress(location.latitude, location.longitude);
    final dbModel = AddPlaceToDbModel(title: title, description: description, locationName: locationName);
    var url = Uri.parse(_publicBackEndApi+'/api/create/new/blog');

    var client = http.Client();
    try {
      var response = await client.post(url,body: {
        'user_name' : dbModel.userName,
        'title' : dbModel.title,
        'description' : dbModel.description,
        'image_url' : dbModel.imageUrl,
        'location_name' : dbModel.locationName
      });
      return response.statusCode;
    }finally{
      client.close();
    }
  }
  
  static Future<List<dynamic>> getCommentsById(String id) async {
    var url = Uri.parse(_publicBackEndApi+'/api/comments/'+id.toString());
    var client = http.Client();
    try {
      var response = await client.get(url);
      return json.decode(response.body);
    } finally {
      client.close();
    }
  }

  static Future<int>addComment(CommentModel commentModel, String id) async {
    var url = Uri.parse(_publicBackEndApi+'/api/add/comment');
    var client = http.Client();
    try{
        var response = await client.post(url,body: {
          'user_id' : '1',
          'blog_post_id' : id,
          'comment' : commentModel.comment
        });
        return response.statusCode;
    } finally {
        client.close();
    }
  }
  
  static Future<int> createNewUser(UserModel userModel) async {
    final url = Uri.parse(_publicBackEndApi+'/api/registration');
    final client = http.Client();
    try {
      var response = await client.post(url,body: {
        'user_name' : userModel.userName,
        'email' : userModel.email,
        'password' : userModel.password
      });
      return response.statusCode;
    } finally {
      client.close();
    }
  }

}