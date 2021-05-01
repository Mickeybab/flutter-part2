import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/global.dart' as global;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool status = false;

  _changeMode(value) async {
    this.setState(() {
      status = value;
    });
    global.currentTheme.switchTheme();

    final prefs = await SharedPreferences.getInstance();
    final key = 'dark_mode';
    prefs.setInt(key, value ? 1 : 0);
  }

  _readMode() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'dark_mode';
    final value = prefs.getInt(key) ?? 0;
    this.setState(() {
      status = value == 1 ? true : false;
    });
  }

  @override
  void initState() {
    super.initState();
    _readMode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFBD40),
        constraints: BoxConstraints.expand(),
        child: Column(children: [
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 40.0,
                ),
                Switch(
                  activeColor: Colors.orange,
                  value: this.status,
                  onChanged: (value) => _changeMode(value),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            constraints: BoxConstraints.expand(
              height: 100.0,
            ),
          )
        ]));
  }
}
