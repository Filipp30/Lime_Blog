import 'package:flutter/material.dart';
import 'package:flutter_forum/Components/place_component.dart';
import 'package:flutter_forum/Providers/places_provider.dart';
import 'package:provider/provider.dart';

class ShowAllPlacesView extends StatelessWidget {
  static const routeName = '/all-published-places';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PlacesProvider>(context, listen: false).getAllPlaces(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Consumer<PlacesProvider>(
            child: const Center(child: Text('Got no places yet, start adding some!')),
            builder: (ctx, PlacesProvider, child) => PlacesProvider.placesList.isEmpty ? child!:
            ListView.builder(
              itemCount:PlacesProvider.placesList.length,
              itemBuilder: (context, index){
                return PlaceComponent(
                  imageUrl: PlacesProvider.placesList[index].imageUrl,
                  title: PlacesProvider.placesList[index].title,
                  authorName: PlacesProvider.placesList[index].userName,
                );
              } ,
            ),
          );
        }
      }
    );
  }
}

