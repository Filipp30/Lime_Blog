import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forum/Providers/google_maps_provider.dart';
import 'package:location/location.dart';
import 'package:flutter_forum/Models/location_model.dart';

class LocationInputComponent extends StatefulWidget {
  late Function locationDataCallBack;
  LocationInputComponent({Key? key,required this.locationDataCallBack}) : super(key: key);

  @override
  _LocationInputComponentState createState() => _LocationInputComponentState();
}

class _LocationInputComponentState extends State<LocationInputComponent> {

  String? _previewImageUrl;
  LocationModel? _locationData;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = GoogleMapsProvider.generateLocationPreviewImage(
        latitude: locData.latitude!, longitude: locData.longitude!);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
      _locationData = LocationModel(latitude: locData.latitude!.toDouble(), longitude: locData.longitude!.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.deepOrange)),
          child: _previewImageUrl == null
              ? const Text(
            'No Location Chosen.',
            textAlign: TextAlign.center,
          )
              : Image.network(
            _previewImageUrl!,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
            ElevatedButton.icon(
              onPressed: () async {
                await _getCurrentUserLocation();
                widget.locationDataCallBack(_locationData);
                },
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
      ],
    );
  }
}
