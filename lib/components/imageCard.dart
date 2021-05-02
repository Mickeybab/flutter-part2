import 'package:flutter/material.dart';
import '../screens/imageDetails.dart';

class ImageCard extends StatelessWidget {
  final String imageTitle;
  final String imageUrl;

  ImageCard({
    this.imageTitle,
    this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              )
            )
          );
  }
}
