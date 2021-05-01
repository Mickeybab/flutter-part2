
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class SoundDetails extends StatefulWidget {
  final String soundTitle;
  final String soundFile;
  final player = AudioCache();


  SoundDetails({
    this.soundTitle,
    this.soundFile
  });

  @override
  SoundDetailsState createState() => SoundDetailsState();
}

class SoundDetailsState extends State<SoundDetails> {

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFBD40),
        constraints: BoxConstraints.expand(),
        child: Card(
          color: Colors.blue,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.soundTitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      widget.player.play(widget.soundFile);
                    },
                    child: Icon(
                      Icons.play_arrow,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
          ),
        ),
      )
    );
  }
}