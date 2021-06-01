import 'package:flutter/material.dart';
import '../screens/imageDetails.dart';

class ImageCard extends StatelessWidget {
  final String imageTitle;
  final String imageUrl;
  final String imageId;

  ImageCard({this.imageTitle, this.imageUrl, this.imageId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageDetails(
                      imageUrl: imageUrl,
                      imageTitle: imageTitle,
                      imageId: imageId,
                    )),
          );
        },
        child: Card(
            child: Column(
          children: <Widget>[
            Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                imageTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )));
  }
}
