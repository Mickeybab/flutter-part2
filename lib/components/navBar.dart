import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  NavBar({
    this.onTap,
    this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.grey),
        BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: 'Albums',
            backgroundColor: Colors.grey),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_photo_alternate),
            label: 'Upload',
            backgroundColor: Colors.grey),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.grey),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.grey),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.orange,
      backgroundColor: Colors.orange,
      onTap: onTap,
    );
  }
}
