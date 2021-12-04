import 'package:flutter/material.dart';

class PublishingPlaceView extends StatelessWidget {
  static const routeName = 'publishing-place';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publishing New Place'),
        centerTitle: true,
      ),
    );
  }
}
