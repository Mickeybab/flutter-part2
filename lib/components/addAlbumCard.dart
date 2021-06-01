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
    return InkWell(
        splashColor: Colors.blue,
        onTap: () {
          print(imageId);
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
