import 'package:flutter/material.dart';

class CredentialsInputComponent extends StatelessWidget {
  final Function setTitleCallBack;
  final Function setDescriptionCallBack;
  CredentialsInputComponent({Key? key,
    required this.setTitleCallBack,
    required this.setDescriptionCallBack
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 1)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 1)),
            hintText: 'Title',
            hintStyle: TextStyle(
              color: Colors.deepOrange,
              fontSize: 17,
            ),
            isDense: true,
          ),
          onChanged: (String value) {
            setTitleCallBack(value);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          minLines: 5,
          maxLines: 5,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 1)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 1)),
            hintText: 'Description',
            hintStyle: TextStyle(
              color: Colors.deepOrange,
              fontSize: 17,
            ),
            isDense: true,
          ),
          onChanged: (String value) {
            setDescriptionCallBack(value);
          },
        ),
      ],
    );
  }
}
