import 'package:flutter/material.dart';
import 'package:flutter2/blocs/auth_bloc.dart';
import 'package:flutter2/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
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
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: _title,
        home: Login(),
        theme: global.lightTheme,
        darkTheme: global.darkTheme,
        themeMode: global.currentTheme.currentTheme(),
      ),
    );
  }
}
