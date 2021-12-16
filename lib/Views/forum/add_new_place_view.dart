import 'package:flutter/material.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/credentials_input_component.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/image_input_component.dart';
import 'package:flutter_forum/Components/AddNewPlaceComponents/location_input_component.dart';
import 'dart:io';
import 'package:flutter_forum/Models/location_model.dart';
import 'package:flutter_forum/Providers/places_provider.dart';
import 'package:flutter_forum/Views/forum/show_all_places_view.dart';
import 'package:provider/provider.dart';

class AddNewPlaceView extends StatefulWidget {
  static const routeName = 'add-new-place';
  @override
  State<AddNewPlaceView> createState() => _AddNewPlaceViewState();
}

class _AddNewPlaceViewState extends State<AddNewPlaceView> {
  late String _title;
  late String _description;
  late LocationModel _locationData;
  late File _storedImage;

  void setTitle(String value){_title = value;}
  void setDescription(String value){_description = value;}
  void setLocationData(LocationModel value){_locationData = value;}
  void setStoredImage(File value){_storedImage = value;}

  bool _showCircularProgressIndicator = false;

  Future<void> _savePlace() async {
    if (_title.isEmpty || _description.isEmpty) {
      return;
    }
    setState(() { _showCircularProgressIndicator = true; });
    var result = await Provider.of<PlacesProvider>(context, listen: false).addBlogPlace(_title,_description,_locationData);
    if (result == true) {
      Navigator.of(context).pop(ShowAllPlacesView.routeName);
    } else {
      setState(() { _showCircularProgressIndicator = false; });
      print('Error in add_new_place_view');
    }
  }

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
          child: _showCircularProgressIndicator ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
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
            onPressed: () async {
              _savePlace();
            },
          ),
        ]
      ),
    );
  }
}
