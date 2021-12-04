import 'package:flutter/material.dart';
import 'package:flutter_forum/Components/place_component.dart';

class PublishedPlacesView extends StatelessWidget {
  static const routeName = '/all-published-places';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, index){
            return PlaceComponent(imageUrl: 'https://placeimg.com/640/480/any', locationName: 'Loret De Mar', authorName: 'Filipp Grigoruk',);
          } ,
      ),
    );
  }
}

