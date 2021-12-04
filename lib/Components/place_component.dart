import 'package:flutter/material.dart';

class PlaceComponent extends StatefulWidget {
  late final String imageUrl;
  late final String title;
  late final String authorName;

  PlaceComponent({required this.imageUrl, required this.title, required this.authorName});
  @override
  State<PlaceComponent> createState() => _PlaceComponentState();
}

class _PlaceComponentState extends State<PlaceComponent> {
  late bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Ink.image(
              image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
            height: 300,
            child: InkWell(
              onTap: (){

              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.black54
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Row(
                      children: [
                        Expanded(
                          child: Text('Location : '+widget.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('Author : '+widget.authorName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          IconButton(
                            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                            color: Colors.deepOrange,
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
