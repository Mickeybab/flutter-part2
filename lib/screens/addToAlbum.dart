import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/imageCard.dart';
import '../components/addAlbumCard.dart';

class AddToAlbum extends StatelessWidget {
  final String imageTitle;
  final String imageId;

  AddToAlbum({this.imageTitle, this.imageId});

  @override
  Widget build(BuildContext context) {
    CollectionReference albums = FirebaseFirestore.instance.collection('album');

    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
          future: albums.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return new ListView(
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                      Padding(padding: const EdgeInsets.all(30)),
                      Center(
                        child: Text(imageTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      )
                    ] +
                    snapshot.data.docs.map((DocumentSnapshot document) {
                      return new AddAlbumCard(
                          name: document.data()['name'],
                          id: document.id,
                          imageId: imageId);
                    }).toList(),
              );
            }
            return Text("Loading...");
          }),
    );
  }
}
