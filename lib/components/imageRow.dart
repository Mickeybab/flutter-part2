import 'package:flutter/material.dart';
import 'imageCard.dart';

class ImageRow extends StatelessWidget {
  final String imageTitle1;
  final String imageUrl1;
  final String imageTitle2;
  final String imageUrl2;

  ImageRow({
    this.imageTitle1,
    this.imageUrl1,
    this.imageTitle2,
    this.imageUrl2
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: ImageCard(
                imageTitle: imageTitle1,
                imageUrl: imageUrl1,
                ),
              ),
            Expanded(
              flex: 5,
              child: ImageCard(
                imageTitle: imageTitle2,
                imageUrl: imageUrl2,
                ),
              ),
          ],
        );
  }
}