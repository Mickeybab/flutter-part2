import 'package:flutter/material.dart';
import 'package:flutter2/components/soundRow.dart';
import '../components/soundRow.dart';

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
                  SoundRow(
                    soundTitle1: "Geese Beat",
                    soundFile1: "sound/GeeseBeat.mp3",
                    soundTitle2: "Turtle Moan",
                    soundFile2: "sound/TurtleMoan.wav",
                  ),
                  SoundRow(
                    soundTitle1: "Knock",
                    soundFile1: "sound/Knock.wav",
                    soundTitle2: "Funny Sounds",
                    soundFile2: "sound/FunnySounds.wav",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
