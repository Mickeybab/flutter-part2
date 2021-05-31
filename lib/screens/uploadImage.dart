import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../components/button.dart';

class UploadImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return UploadImageState();
    }
}

class UploadImageState extends State {
  PickedFile imgFile;
  CollectionReference images = FirebaseFirestore.instance.collection('images');
  Widget build(BuildContext context) {

    void _openGallery(BuildContext context) async {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery,);
      setState(() {
        imgFile = pickedFile;        
      });

      Navigator.pop(context);
    }

    void _openCamera(BuildContext context) async {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.camera,);
      setState(() {
        imgFile = pickedFile;        
      });

      Navigator.pop(context);
    }

    Future _showChoiceDialog(BuildContext context) {
      return showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Select source",
            style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(height: 1, color: Colors.blue,),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(Icons.account_box, color: Colors.blue,),
                  ),
                  Divider(height: 1, color: Colors.blue,),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(Icons.camera, color: Colors.blue,),
                  ),
                ],
              ),
            ),
          );
      });
    };

    Future _showAlertDialog(BuildContext context) {
      Widget okButton = TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text("OK"),
      );

      AlertDialog alert = AlertDialog(
        title: Text("Done !"),
        actions: [
          okButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    Future _uploadToFirebase(BuildContext context) async {
      String fileName = basename(imgFile.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(File(imgFile.path));
      uploadTask.then((res) async => {
        images.add({
          'album': '',
          'title': 'Title',
          'url': await res.ref.getDownloadURL(),
        })
        .then((value) => _showAlertDialog(context))
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
                child: (imgFile == null) ?
                Text("Choose File") :
                Image.file(File(imgFile.path)),
              ),
              ElevatedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child:
                  Text("Select Image"),
              ),
              ElevatedButton(
                onPressed: (imgFile == null) ?
                null :
                () {
                  _uploadToFirebase(context);
                },
                child:
                  Text("Upload"),
              )
            ],
          )
        )
    );
  }
}