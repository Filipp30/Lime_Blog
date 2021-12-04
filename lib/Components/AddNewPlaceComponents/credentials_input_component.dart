import 'package:flutter/material.dart';

class CredentialsInputComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Title',
              hintStyle: TextStyle(
                color: Colors.deepOrange,
                fontSize: 17,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Description',
              hintStyle: TextStyle(
                color: Colors.deepOrange,
                fontSize: 17,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Your Name',
              hintStyle: TextStyle(
                color: Colors.deepOrange,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
