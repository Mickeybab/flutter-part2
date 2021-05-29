import 'package:flutter/material.dart';
import 'package:flutter2/components/albumGrid.dart';

class Album extends StatelessWidget {
  Future<double> get _height => Future<double>.value(1000);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
        future: _height,
        initialData: 300,
        builder: (context, snapshot) {
          return AnimatedContainer(
            color: Color(0xFFBD40),
            duration: Duration(seconds: 2),
            height: snapshot.data,
            child: AlbumFeed(),
          );
        });
  }
}
