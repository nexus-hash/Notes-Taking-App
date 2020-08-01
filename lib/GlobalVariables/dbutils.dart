

import 'package:flutter_app/Ifloggedin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class DbUtils {
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
  static String UserName = googleSignIn.currentUser.displayName;
  static String Mail = googleSignIn.currentUser.email;
  static String Photo = googleSignIn.currentUser.photoUrl;



  static final db =Firestore.instance;
  static void createRecord(String title,String description) async {
    final FirebaseUser User  =await auth.currentUser();
    final String UserId = User.uid;
    await db.collection("users")
        .document(UserId).collection("notes").add({
      'title': title,
      'description': description
    });
  }



}

class NotesCollection {
    String title;
    String description;
    NotesCollection(String v,String h){
      title =v;
      description = h;
    }
}