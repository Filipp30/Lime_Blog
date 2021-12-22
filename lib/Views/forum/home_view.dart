import 'package:flutter/material.dart';

import 'package:flutter_forum/Views/forum/add_new_place_view.dart';
import 'package:flutter_forum/Views/forum/show_all_places_view.dart';

class Home extends StatelessWidget {
  static const routeName = 'home-page';
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
        onPressed: () { Navigator.of(context).pushNamed(AddNewPlaceView.routeName); },
        child: const Icon(Icons.add),
      ),
    );
  }
}