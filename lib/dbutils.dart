

import 'package:flutter_app/Ifloggedin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';


class DbUtils {
  static bool isLoggedIn =false;
  static GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  static Future <void> login() async{
    try{
      await googleSignIn.signIn();
      isLoggedIn =true;

    }
    catch(err){
      print(err);
    }

  }

  static logout() async {
    googleSignIn.signOut();
    isLoggedIn =false;

  }

}