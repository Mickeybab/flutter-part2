import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'imageCard.dart';

class AlbumFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference albums = FirebaseFirestore.instance.collection('album');

    return FutureBuilder<QuerySnapshot>(
        future: albums.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new Text(document.data()['name']);
              }).toList(),
            );
          }
          return Text("Loading...");
        });
  }
}
