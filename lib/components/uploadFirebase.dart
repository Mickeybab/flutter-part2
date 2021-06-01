import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UploadFirebase extends StatefulWidget {
  final PickedFile imgFile;
  const UploadFirebase({ Key key, this.imgFile }) : super(key: key);

  @override
  State<UploadFirebase> createState() => _UploadFirebaseState();
}

class _UploadFirebaseState extends State<UploadFirebase> {
  CollectionReference images = FirebaseFirestore.instance.collection('images');
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

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
      String fileName = basename(widget.imgFile.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(File(widget.imgFile.path));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Uploading...')));
      uploadTask.then((res) async => {
        images.add({
          'album': '',
          'title': myController.text,
          'url': await res.ref.getDownloadURL(),
        })
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Done !'))))
      });
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Choose a title';
              }
              return null;
            },
            controller: myController,
          ),
          ElevatedButton(
            onPressed: (widget.imgFile == null)
              ? null
              : () {
                if (_formKey.currentState.validate()) {
                  _uploadToFirebase(context);
                }
              },
            child:
              Text("Upload"),
          )
        ],
      )
    );
  }
}