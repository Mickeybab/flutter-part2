import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/appScaffold.dart';
import 'config/global.dart' as global;

// import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static const String _title = 'Epitech';

  _readMode() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'dark_mode';
    final value = prefs.getInt(key) ?? 0;
    if ((value == 1 && global.currentTheme.currentTheme() == ThemeMode.light) ||
        (value == 0 && global.currentTheme.currentTheme() == ThemeMode.dark)) {
      global.currentTheme.switchTheme();
    }
  }

  @override
  void initState() {
    super.initState();
    _readMode();
    global.currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      theme: global.lightTheme,
      darkTheme: global.darkTheme,
      themeMode: global.currentTheme.currentTheme(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onTap: _onItemTapped,
      selectedIndex: _selectedIndex,
    );
  }
}
