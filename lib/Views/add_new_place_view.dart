import 'package:flutter/material.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/credentials_input_component.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/image_input_component.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/location_input_component.dart';
import 'dart:io';

import 'package:flutter_forum/Models/location_model.dart';
import 'package:flutter_forum/Services/data_base_service.dart';

class AddNewPlaceView extends StatefulWidget {
  static const routeName = 'add-new-place';

  @override
  State<AddNewPlaceView> createState() => _AddNewPlaceViewState();
}

class _AddNewPlaceViewState extends State<AddNewPlaceView> {
  late String title;
  late String description;
  late LocationModel locationData;
  late File storedImage;

  void setTitle(String value){title = value;}
  void setDescription(String value){description = value;}
  void setLocationData(LocationModel value){locationData = value;}
  void setStoredImage(File value){storedImage = value;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publishing New Place'),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(

          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageInputComponent(),
                  LocationInputComponent(locationDataCallBack: setLocationData,),
                  SizedBox(height: 20,),
                  CredentialsInputComponent(setTitleCallBack: setTitle, setDescriptionCallBack: setDescription),
                ],
              ),
            ),
          ),
        ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
            ),
            onPressed: (){
              DataBaseService.addPlace(title, description, locationData);
            },
          ),
        ]
      ),
    );
  }
}
