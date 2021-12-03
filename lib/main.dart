import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Lime Blog',
    theme: ThemeData(
      primaryColor: Colors.blue
    ),
    home: App(),
  ));
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lime Blog'),
        centerTitle: true,
      ),
      body: Text('Home'),
    );
  }
}


