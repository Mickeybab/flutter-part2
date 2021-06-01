import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/screens/albumDetails.dart';
import '../screens/imageDetails.dart';

class AddAlbumCard extends StatelessWidget {
  final String name;
  final String id;
  final String imageId;

  AddAlbumCard({this.name, this.id, this.imageId});

  @override
  Widget build(BuildContext context) {
    DocumentReference album =
        FirebaseFirestore.instance.collection('album').doc(id);

    return InkWell(
        splashColor: Colors.blue,
        onTap: () {
          FirebaseFirestore.instance
              .collection('images')
              .doc(imageId)
              .update({'album': album});
          Navigator.pop(context);
        },
        child: Card(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )));
  }
}
