import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/appScaffold.dart';
import 'config/global.dart' as global;

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static const String _title = 'Epitech';
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

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
    initializeFlutterFire();
    super.initState();
    _readMode();
    global.currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // // Show error message if initialization failed
    // if(_error) {
    //   return SomethingWentWrong();
    // }

    // // Show a loader until FlutterFire is initialized
    // if (!_initialized) {
    //   return Loading();
    // }
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
