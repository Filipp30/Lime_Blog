import 'package:flutter/material.dart';
import 'package:flutter_forum/Providers/places_provider.dart';
import 'package:flutter_forum/Views/add_comment_view.dart';
import 'package:flutter_forum/Views/place_details_view.dart';

import 'package:provider/provider.dart';
import 'Views/home_view.dart';
import 'Views/publishing_place_view.dart';
import 'Views/show_all_places_view.dart';

void main() {
  runApp(ChangeNotifierProvider.value(
    value: PlacesProvider(),
    child: MaterialApp(
      title: 'Lime Blog',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
      routes: {
        ShowAllPlacesView.routeName: (context) => ShowAllPlacesView(),
        PlaceDetailsView.routeName: (context) => PlaceDetailsView(),
        AddCommentView.routeName: (context) => AddCommentView(),
        PublishingPlaceView.routeName: (context) => PublishingPlaceView(),
      },
    ),
  ));
}
