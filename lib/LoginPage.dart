import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/GlobalVariables/dbutils.dart';
import 'Ifloggedin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController2 = TextEditingController();

  String Password = "";
  String Username = "";

  final _formKey = GlobalKey<FormState>();

  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 5.0);
  TextStyle linkStyle = TextStyle(color: Colors.blue, fontSize: 5.0);

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("User Conformation"),
            content: Text("Proceed with previous Login"),
            actions: <Widget>[
              RaisedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoggedIn()))
                },
                child: Text("Confirm"),
              ),
              RaisedButton(
                onPressed: () {
                  DbUtils.logout();
                },
                child: Text("Change"),
              )
            ],
          );
        });
  }

  Future<void> navigationAfterLogin() async {
    await DbUtils.login();
    await DbUtils.getList();
    Navigator.of(context).push(MaterialPageRoute(builder: (context){return LoggedIn();}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.black, Colors.black54])),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              child: ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .37,
                  color: Colors.white.withOpacity(0.5),
                ),
                clipper: CustomClipPath2(),
              ),
            ),
            Positioned(
              top: 0.0,
              child: ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .35,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: MediaQuery.of(context).size.height * .045,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.red,
                          ),
                          onPressed: () => {},
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * .16,
                          child: Container(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.black54.withOpacity(0.5),
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    decorationColor: Colors.indigoAccent,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 8.0,
                                        color: Colors.red
                                            .withOpacity(0.1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                clipper: CustomClipPath(),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .45,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Container(
                width: MediaQuery.of(context).size.width * .86,
                height: MediaQuery.of(context).size.height * .08,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 7.0)
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .72,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (value.isEmpty) {
                            return 'Please Enter Some Text';
                          } else if (emailValid) {
                            return null;
                          }
                          return 'Username Invalid';
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Username"),
                        onChanged: (text) {
                          Username = text;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .55,
              right: MediaQuery.of(context).size.width * 0.07,
              child: Container(
                width: MediaQuery.of(context).size.width * .86,
                height: MediaQuery.of(context).size.height * .08,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 7.0)
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .72,
                    child: TextFormField(
                      controller: nameController2,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                      onChanged: (text2) {
                        Password = text2;
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .67,
              right: MediaQuery.of(context).size.width * .38,
              child: new Container(
                width: MediaQuery.of(context).size.width * .24,
                height: MediaQuery.of(context).size.height * .067,
                child: new RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black87, fontSize: 20.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      side: BorderSide(color: Colors.blueGrey, width: 4.0)),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .75,
              right: MediaQuery.of(context).size.width * .25,
              child: Container(
                width: MediaQuery.of(context).size.width * .50,
                height: MediaQuery.of(context).size.height * .045,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "--Or--",
                      style:
                          TextStyle(fontSize: 15.0, color: Colors.yellowAccent),
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .8,
              right: MediaQuery.of(context).size.width * .18,
              child: Container(
                width: MediaQuery.of(context).size.width * .64,
                height: MediaQuery.of(context).size.height * .07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: Colors.white),
                child: RaisedButton(
                  onPressed: () {
                    DbUtils.isLoggedIn
                        ? createAlertDialog(context)
                        : FutureBuilder(
                            future: navigationAfterLogin(),
                            builder: (context, snapshot) {
                              return Center(child: CircularProgressIndicator());
                            },
                          );
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                            "assets/images/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png"),
                      ),
                      Container(
                        child: Text(
                          "Sign In Using Google",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .94,
              right: MediaQuery.of(context).size.width * .25,
              child: Container(
                width: MediaQuery.of(context).size.width * .50,
                height: MediaQuery.of(context).size.height * .045,
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(style: defaultStyle, children: <TextSpan>[
                    TextSpan(
                        text: 'Forgot Password?',
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.yellowAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("hello");
                          })
                  ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoggedIn(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
