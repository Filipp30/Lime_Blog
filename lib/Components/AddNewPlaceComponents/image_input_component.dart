import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class ImageInputComponent extends StatefulWidget {
  const ImageInputComponent({Key? key}) : super(key: key);

  @override
  _ImageInputComponentState createState() => _ImageInputComponentState();
}

class _ImageInputComponentState extends State<ImageInputComponent> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imageFile = await _picker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile == null) {
      return;
    }

    setState(() {
      _storedImage = File(imageFile.path);
    });

    // final appDir = await syspaths.getApplicationDocumentsDirectory();               // get the directory from devise where we can store the picture.
    // final fileName = path.basename(imageFile.path);                                // get the name of the picture that was automatically created.
    // final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName'); // copy saved file to appDir location with the file name: fileName.
    // widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.deepOrange),
          ),
          child: _storedImage != null ? Image.file(_storedImage!, fit: BoxFit.cover, width: double.infinity,) : const Text('No Image taken.', textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        const SizedBox(width: 10,),

          ElevatedButton.icon(
            onPressed: (){
              _takePicture();
            },
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
            ),
          ),

      ],
    );
  }
}
