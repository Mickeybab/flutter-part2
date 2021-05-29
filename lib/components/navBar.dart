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
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.album),
          label: 'Albums',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.orange,
      onTap: onTap,
    );
  }
}
