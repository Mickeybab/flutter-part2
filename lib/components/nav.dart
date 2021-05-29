import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/blocs/auth_bloc.dart';
import 'package:flutter2/components/appScaffold.dart';
import 'package:flutter2/screens/login.dart';
import 'package:provider/provider.dart';

class NavWidget extends StatefulWidget {
  NavWidget({Key key}) : super(key: key);

  @override
  _NavWidgettState createState() => _NavWidgettState();
}

class _NavWidgettState extends State<NavWidget> {
  int _selectedIndex = 0;
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((gUser) {
      if (gUser == null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
        loginStateSubscription.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

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
