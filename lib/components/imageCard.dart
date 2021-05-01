import 'package:flutter/material.dart';
import '../screens/imageDetails.dart';

class ImageCard extends StatelessWidget {
  final String imageTitle;
  final String imageUrl;
  ImageCard({this.imageTitle, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        height: 150,
        child: Card(
          color: Colors.blue,
          elevation: 0,
          child: Column(
            children: <Widget>[
              Text(
                imageTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(top: 10.0),
                child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageDetails(
                        imageUrl: imageUrl,
                        imageTitle: imageTitle,
                      )),
                    );
                  },
                  child: Container(
                    child: Image.network(imageUrl)
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
