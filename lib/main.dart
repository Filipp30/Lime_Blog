import 'package:flutter/material.dart';
import 'package:flutter_forum/Providers/places_provider.dart';
import 'package:flutter_forum/Views/forum/add_comment_view.dart';
import 'package:flutter_forum/Views/auth/landing_page.dart';
import 'package:flutter_forum/Views/forum/place_details_view.dart';
import 'package:flutter_forum/Providers/comments_provider.dart';
import 'package:provider/provider.dart';
import 'Views/forum/add_new_place_view.dart';
import 'Views/forum/show_all_places_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PlacesProvider()),
      ChangeNotifierProvider(create: (_) => CommentsProvider()),
    ],
    child: MaterialApp(
      title: 'Lime Blog',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LandingPage(),
      // initialRoute: AddNewPlaceView.routeName,
      routes: {
        ShowAllPlacesView.routeName: (context) => ShowAllPlacesView(),
        PlaceDetailsView.routeName: (context) => PlaceDetailsView(),
        AddCommentView.routeName: (context) => AddCommentView(),
        AddNewPlaceView.routeName: (context) => AddNewPlaceView(),
      },
    ),
  ));
}
