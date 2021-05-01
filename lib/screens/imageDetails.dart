
import 'package:flutter/material.dart';

class ImageDetails extends StatefulWidget {
  final String imageTitle;
  final String imageUrl;


  ImageDetails({
    this.imageTitle,
    this.imageUrl
  });

  @override
  ImageDetailsState createState() => ImageDetailsState();
}

class ImageDetailsState extends State<ImageDetails> {

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
                  widget.imageTitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Image.network(widget.imageUrl),
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
                ),
              ],
          ),
        ),
      )
    );
  }
}