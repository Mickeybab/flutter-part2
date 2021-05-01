import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final Image img;

  ProfileImage({@required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(height: 150.0),
        child:
            ClipRRect(child: img, borderRadius: BorderRadius.circular(150.0)));
  }
}
