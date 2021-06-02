import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAlbumCard extends StatelessWidget {
  final String name;
  final String id;
  final String imageId;

  AddAlbumCard({this.name, this.id, this.imageId});

  @override
  Widget build(BuildContext context) {
    DocumentReference album =
        FirebaseFirestore.instance.collection('albums').doc(id);

    return InkWell(
        splashColor: Colors.blue,
        onTap: () {
          FirebaseFirestore.instance
              .collection('images')
              .doc(imageId)
              .update({'albums': album});
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
