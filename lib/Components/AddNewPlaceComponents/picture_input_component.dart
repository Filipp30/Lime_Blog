import 'package:flutter/material.dart';

class PictureInputComponent extends StatefulWidget {
  const PictureInputComponent({Key? key}) : super(key: key);

  @override
  _PictureInputComponentState createState() => _PictureInputComponentState();
}

class _PictureInputComponentState extends State<PictureInputComponent> {
  @override
  Widget build(BuildContext context) {
    return Text('Take a picture');
  }
}
