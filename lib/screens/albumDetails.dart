import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/imageCard.dart';

class AlbumDetail extends StatelessWidget {
  final String name;
  final String id;

  AlbumDetail({this.name, this.id});

  @override
  Widget build(BuildContext context) {
    DocumentReference album =
        FirebaseFirestore.instance.collection('album').doc(id);
    Query images = FirebaseFirestore.instance
        .collection('images')
        .where('album', isEqualTo: album);

    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
          future: images.get(),
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
                        child: Text(name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      )
                    ] +
                    snapshot.data.docs.map((DocumentSnapshot document) {
                      return new ImageCard(
                        imageTitle: document.data()['title'],
                        imageUrl: document.data()['url'],
                      );
                    }).toList(),
              );
            }
            return Text("Loading...");
          }),
    );
  }
}
