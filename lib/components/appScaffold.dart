import 'package:flutter/material.dart';
import 'navBar.dart';

import '../screens/home.dart';
import '../screens/album.dart';
import '../screens/profile.dart';
import '../screens/settings.dart';
import '../screens/uploadImage.dart';

class AppScaffold extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  AppScaffold({
    this.onTap,
    this.selectedIndex,
  });

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Album(),
    UploadImage(),
    Profile(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Epitech',
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Color(0xFFBD40),
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: NavBar(
        onTap: onTap,
        currentIndex: selectedIndex,
      ),
    );
  }
}
