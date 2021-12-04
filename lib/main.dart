import 'package:flutter/material.dart';
import 'package:flutter_forum/Views/add_comment_view.dart';
import 'package:flutter_forum/Views/place_details_view.dart';
import 'package:flutter_forum/Views/published_places_view.dart';

import 'Views/home_view.dart';
import 'Views/publishing_place_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Lime Blog',
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: Home(),
    routes: {
      PublishedPlacesView.routeName: (context) => PublishedPlacesView(),
      PlaceDetailsView.routeName: (context) => PlaceDetailsView(),
      AddCommentView.routeName: (context) => AddCommentView(),
      PublishingPlaceView.routeName: (context) => PublishingPlaceView(),
    },
  ));
}
