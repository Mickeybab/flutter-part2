import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/uploadFirebase.dart';

class UploadImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UploadImageState();
  }
}

class UploadImageState extends State {
  PickedFile imgFile;
  Widget build(BuildContext context) {
    void _openGallery(BuildContext context) async {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
      );
      setState(() {
        imgFile = pickedFile;
      });

      Navigator.pop(context);
    }

    void _openCamera(BuildContext context) async {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
      );
      setState(() {
        imgFile = pickedFile;
      });

      Navigator.pop(context);
    }

    Future _showChoiceDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Select source",
                style: TextStyle(color: Colors.blue),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                    ListTile(
                      onTap: () {
                        _openGallery(context);
                      },
                      title: Text("Gallery"),
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.blue,
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                    ListTile(
                      onTap: () {
                        _openCamera(context);
                      },
                      title: Text("Camera"),
                      leading: Icon(
                        Icons.camera,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Container(
        color: Color(0xFFBD40),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Card(
              child: (imgFile == null)
                  ? Text("Choose File")
                  : Image.file(File(imgFile.path)),
            ),
            ElevatedButton(
              onPressed: () {
                _showChoiceDialog(context);
              },
              child: Text("Select Image"),
            ),
            UploadFirebase(
              imgFile: imgFile,
            )
          ],
        )));
  }
}
