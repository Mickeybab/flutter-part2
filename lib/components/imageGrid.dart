import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'imageCard.dart';

class ImageFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference images =
        FirebaseFirestore.instance.collection('images');

    return FutureBuilder<QuerySnapshot>(
        future: images.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return new ListView(
              padding: const EdgeInsets.all(10),
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new ImageCard(
                  imageTitle: document.data()['title'],
                  imageUrl: document.data()['url'],
                );
              }).toList(),
            );
          }
          return Text("Loading...");
        });
  }
}
