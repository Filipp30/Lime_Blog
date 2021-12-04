import 'package:flutter/material.dart';
import 'package:flutter_forum/Views/published_places_view.dart';
import 'package:flutter_forum/Views/publishing_place_view.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lime Blog', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: PublishedPlacesView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.of(context).pushNamed(PublishingPlaceView.routeName); },
        child: const Icon(Icons.add),
      ),
    );
  }
}