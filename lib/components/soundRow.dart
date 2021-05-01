import 'package:flutter/material.dart';
import 'soundCard.dart';

class SoundRow extends StatelessWidget {
  final String soundTitle1;
  final String soundFile1;
  final String soundTitle2;
  final String soundFile2;

  SoundRow({
    this.soundTitle1,
    this.soundFile1,
    this.soundTitle2,
    this.soundFile2
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: SoundCard(
                soundTitle: soundTitle1,
                soundFile: soundFile1,
                ),
              ),
            Expanded(
              flex: 5,
              child: SoundCard(
                soundTitle: soundTitle2,
                soundFile: soundFile2,
                ),
              ),
          ],
        );
  }
}