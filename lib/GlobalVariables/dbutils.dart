import 'package:flutter_app/Ifloggedin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbUtils {
  static bool isLoggedIn = false;
  static GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Future<FirebaseUser> login() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await auth.signInWithCredential(credential)).user;
    isLoggedIn = true;
    return user;
  }

  static logout() async {
    googleSignIn.signOut();
    isLoggedIn = false;
  }
}
