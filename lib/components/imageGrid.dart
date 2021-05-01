import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'imageCard.dart';

class ImageFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference images = FirebaseFirestore.instance.collection('images');

    return FutureBuilder<QuerySnapshot>(
      future: images.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new Card(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      document.data()['url'],
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 500,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        document.data()['title']
                      ),
                    ),
                  ],
                )
              );
            }).toList(),
          );
        }
        return Text("loading");
      }
    );
  }
}