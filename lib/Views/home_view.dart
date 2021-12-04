import 'package:flutter/material.dart';

import 'package:flutter_forum/Views/publishing_place_view.dart';
import 'package:flutter_forum/Views/show_all_places_view.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Lime Blog', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ShowAllPlacesView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.of(context).pushNamed(PublishingPlaceView.routeName); },
        child: const Icon(Icons.add),
      ),
    );
  }
}