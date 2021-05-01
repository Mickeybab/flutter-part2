import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  Future<double> get _height => Future<double>.value(1000);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void _startLogin() async {
    UserCredential _user = await this.signInWithGoogle();
    print(_user);
    print("Ok");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
        future: _height,
        initialData: 300,
        builder: (context, snapshot) {
          return AnimatedContainer(
            color: Color(0xFFBD40),
            duration: Duration(seconds: 2),
            height: snapshot.data,
            child: ElevatedButton(
              child: const Text('SIGN IN'),
              onPressed: _startLogin,
            ),
          );
        });
  }
}
