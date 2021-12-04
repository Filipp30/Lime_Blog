import 'package:flutter/material.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/credentials_input_component.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/picture_input_component.dart';

class AddNewPlaceView extends StatefulWidget {
  static const routeName = 'add-new-place';

  @override
  State<AddNewPlaceView> createState() => _AddNewPlaceViewState();
}

class _AddNewPlaceViewState extends State<AddNewPlaceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publishing New Place'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CredentialsInputComponent(),
          PictureInputComponent(),

        ],
      ),
    );
  }
}
