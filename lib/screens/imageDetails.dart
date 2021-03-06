import 'package:flutter/material.dart';
import 'package:flutter2/components/button.dart';
import 'package:flutter2/screens/addToAlbum.dart';

class ImageDetails extends StatefulWidget {
  final String imageTitle;
  final String imageUrl;
  final String imageId;

  ImageDetails({this.imageTitle, this.imageUrl, this.imageId});

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
            padding: EdgeInsets.only(top: 50.0),
            child: ListView(
              children: <Widget>[
                Center(
                    child: Text(
                  widget.imageTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                )),
                Container(
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                MyButton(
                    text: "Add to album",
                    onPress: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddToAlbum(
                                        imageTitle: widget.imageTitle,
                                        imageId: widget.imageId,
                                      )))
                        }),
              ],
            ),
          ),
        ));
  }
}
