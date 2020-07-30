import 'package:flutter/material.dart';
import 'package:flutter_app/dbutils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'LoginPage.dart';

class LoggedIn extends StatefulWidget {
  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.amber,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*.17,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*.05,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.indigo,
                                Colors.indigoAccent
                              ]
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.fast_rewind),
                            onPressed: (){DbUtils.logout();
                            Navigator.push(context, MaterialPageRoute(
                              builder: ( context){ return LoginPage();}
                            ));
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


