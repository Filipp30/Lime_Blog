
import 'package:flutter/material.dart';
import 'package:flutter_forum/Models/place_model.dart';

class PlaceDetailsView extends StatefulWidget {
  static const routeName = '/place-details' ;
  @override
  State<PlaceDetailsView> createState() => _PlaceDetailsViewState();
}

class _PlaceDetailsViewState extends State<PlaceDetailsView> {

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as PlaceModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title.toString()),
        centerTitle: true,
      ),
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
