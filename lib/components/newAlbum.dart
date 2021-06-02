import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter2/screens/albumDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewAlbum extends StatefulWidget {
  const NewAlbum({Key key}) : super(key: key);

  @override
  State<NewAlbum> createState() => _NewAlbumState();
}

class _NewAlbumState extends State<NewAlbum> {
  CollectionReference albums = FirebaseFirestore.instance.collection('albums');
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future _createNewAlbum(BuildContext context) async {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Creating...')));
      albums.add({
        'name': myController.text,
        'owner': auth.currentUser.uid,
      }).then((value) => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumDetail(
                        id: value.id,
                        name: myController.text,
                      )),
            )
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
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _createNewAlbum(context);
                }
              },
              child: Text("Create"),
            )
          ],
        ));
  }
}
