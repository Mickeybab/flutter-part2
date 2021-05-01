import 'package:flutter/material.dart';
import 'package:flutter2/components/imageRow.dart';
import '../components/imageRow.dart';

class Home extends StatelessWidget {
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ImageRow(
                    imageTitle1: "Geese Beat",
                    imageUrl1: "gs://flutter-2-67e97.appspot.com/Screenshot_20210110_001033.png",
                    imageTitle2: "Turtle Moan",
                    imageUrl2: "sound/TurtleMoan.wav",
                  ),
                  ImageRow(
                    imageTitle1: "Knock",
                    imageUrl1: "sound/Knock.wav",
                    imageTitle2: "Funny Sounds",
                    imageUrl2: "sound/FunnySounds.wav",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
