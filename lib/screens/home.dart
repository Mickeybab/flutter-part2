import 'package:flutter/material.dart';
import 'package:flutter2/components/imageRow.dart';
import '../components/imageGrid.dart';

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
            child: ImageFeed(),
            // child: SingleChildScrollView(
            //   child: Column(
            //     children: <Widget>[
            //       ImageRow(
            //         imageTitle1: "Geese Beat",
            //         imageUrl1: "https://firebasestorage.googleapis.com/v0/b/flutter-2-67e97.appspot.com/o/Screenshot_20210110_001033.png?alt=media&token=80a00bd5-082a-4112-8dc9-365bcb593337",
            //         imageTitle2: "Turtle Moan",
            //         imageUrl2: "https://firebasestorage.googleapis.com/v0/b/flutter-2-67e97.appspot.com/o/39E8A589-E709-41BC-BDC7-CAA357637182.jpeg?alt=media&token=5bf1d801-1c63-4abc-9f8b-11d6f42f3c13",
            //       ),
            //       ImageRow(
            //         imageTitle1: "Knock",
            //         imageUrl1: "sound/Knock.wav",
            //         imageTitle2: "Funny Sounds",
            //         imageUrl2: "sound/FunnySounds.wav",
            //       ),
            //     ],
            //   ),
            // ),
          );
        });
  }
}
