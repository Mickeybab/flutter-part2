import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter2/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/profileImage.dart';
import '../components/button.dart';
import '../components/takePicture.dart';
import '../config/global.dart' as global;

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Image img = global.img;

  _setImage(result) async {
    bool exist = await File(result).exists();
    if (exist) {
      global.img = Image.file(
        File(result),
      );
      this.setState(() {
        img = global.img;
      });
    }
  }

  _getImage() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'profile_picture';
    final result = prefs.getString(key) ?? null;
    if (result != null) {
      _setImage(result);
    }
  }

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    void _showCamera() async {
      final cameras = await availableCameras();
      final camera = cameras.last;

      final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TakePicturePage(camera: camera)));

      _setImage(result);

      final prefs = await SharedPreferences.getInstance();
      final key = 'profile_picture';
      prefs.setString(key, result);
    }

    return Container(
        color: Color(0xFFBD40),
        constraints: BoxConstraints.expand(),
        child: StreamBuilder<User>(
          stream: authBloc.currentUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text(snapshot.data.displayName),
                ProfileImage(img: img),
                MyButton(
                  text: "Changer l'image",
                  onPress: _showCamera,
                ),
                MyButton(
                  text: "Logout",
                  onPress: () => authBloc.logout(),
                )
              ],
            ));
          },
        ));
  }
}
