import 'package:flutter/material.dart';
import 'package:flutter2/screens/albumDetails.dart';

class AlbumCard extends StatelessWidget {
  final String name;
  final String id;

  AlbumCard({this.name, this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlbumDetail(
                      id: id,
                      name: name,
                    )),
          );
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
