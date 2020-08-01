import 'package:flutter/material.dart';
import 'package:flutter_app/EditNote.dart';
import 'package:flutter_app/GlobalVariables/GlobalVar.dart';
import 'package:flutter_app/GlobalVariables/dbutils.dart';
import 'package:flutter_app/WriteNote.dart';
import 'LoginPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoggedIn extends StatefulWidget {
  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {




  Color defaultcolor = Colors.black87;

  TextEditingController nameController = TextEditingController();

  static final String assetName = 'assets/Icons_MainPage/tunewhite.svg';

  final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo'
  );

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: defaultcolor,
            title: Text("User Conformation:",style: TextStyle(color: Colors.white),),
            content: Text("Proceed with Sign out?",style: TextStyle(color: Colors.white),),
            actions: <Widget>[
              RaisedButton(
                onPressed: () => {
                  Navigator.of(context, rootNavigator: true).pop('dialog')
                },
                child: Text("Cancel"),
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  FutureBuilder(
                    future: navigationAfterLogout(),
                    builder: (context, snapshot) {
                      return Center(child: CircularProgressIndicator());
                    },
                  );
                },
                child: Text("Confirm"),
              )
            ],
          );
        });
  }

  String temp = "";
  createAlertDialog2(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Text("Create New Note",style: TextStyle(color: Colors.white),),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Some Text";
                  }
                  return null;
                },

                decoration: InputDecoration(
                    hintText: "Title",
                    labelText: "Title",
                    labelStyle: TextStyle(
                      color: Colors.white
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
                onChanged: (text) {
                  temp = text;

                },
              ),
            ),

            actions: <Widget>[
              RaisedButton(
                onPressed: () => {
                  Navigator.of(context, rootNavigator: true).pop('dialog')
                },
                child: Text("Cancel"),
              ),
              RaisedButton(
                color: Colors.black87,
                onPressed: () {


                  if (_formKey.currentState.validate()) {
                    GVar.Title=temp;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){return NoteTaking();

                        }
                    ));
                  }
                },
                child: Text("Confirm"),
              )
            ],
          );
        });
  }

  Future<void> navigationAfterLogout() async {
    await DbUtils.logout()
        .then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context){return LoginPage();})));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.black87
              ),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                      child: Text(DbUtils.UserName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.5),
                      )
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(DbUtils.Mail,style: TextStyle(
                      color: Colors.white
                    ),)
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: (){createAlertDialog(context);},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(

                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.0,0.0),
                            blurRadius: 1.0,
                            color: Colors.redAccent,
                            spreadRadius: 1.0
                        )
                      ],
                      color: Colors.red
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Good Bye, See you Later.",style: TextStyle(color: Colors.white,fontSize: 17.0),),)
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.4,
          child: Stack(
            children: <Widget>[

              Positioned(
                top: 0.0,
                child: ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.4,
                  color: defaultcolor,
                ),
                clipper: CustomClipPath(),
              ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*.07,
                  left: MediaQuery.of(context).size.width*.3,
                  child: Container(
                    width: MediaQuery.of(context).size.width*.5,
                    height: MediaQuery.of(context).size.height*.23,

                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Your's "
                                ,style: TextStyle(
                            fontSize: 70.0,
                            fontFamily: 'Nicholia',
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 8.0,
                                  color: Colors.white
                                      .withOpacity(0.9),
                                ),
                              ],
                            color: Colors.white
                          ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            GVar.DiaryNam
                            ,style: TextStyle(
                              fontSize: 70.0,
                              fontFamily: 'Nicholia',
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 8.0,
                                  color: Colors.white
                                      .withOpacity(0.9),
                                ),
                              ],
                              color: Colors.white
                          ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
          Positioned(
            top: MediaQuery.of(context).size.height*.055,
            left: -MediaQuery.of(context).size.width*0.05,
              child: Container(
                width: MediaQuery.of(context).size.width*.2,
                height: MediaQuery.of(context).size.height*.1,

                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: Icon(MdiIcons.tune,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: (){_scaffoldkey.currentState.openEndDrawer();}
                      )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
          ),
        ),
              Positioned(
                top: MediaQuery.of(context).size.height * .3,
                right: MediaQuery.of(context).size.width * .42525,
                child: Container(
                  width: MediaQuery.of(context).size.width * .155,
                  height: MediaQuery.of(context).size.width * .155,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        color: Colors.white,
                        spreadRadius: 3.0
                      )
                    ],
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
                      color: Colors.red),
                  child: RaisedButton(
                    onPressed: () {
                      createAlertDialog2(context);
                    },
                    child: Icon(Icons.add,color: Colors.white,size: 25.0,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
                    ),
                    color: Colors.red,
                  ),
                ),
              ),

            ],
          ),
        ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.6,
              child: ListView.separated(
                separatorBuilder: (context,index){return SizedBox(height: 12.0,);},
                  padding: const EdgeInsets.all(20),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: GVar.notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(30.0),
                      height: MediaQuery.of(context).size.height*.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.tealAccent
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(GVar.notes[index].title,
                            style: TextStyle(
                              fontSize: 19.0,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontFamily: 'chalkboard'
                            ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: MediaQuery.of(context).size.height*.08,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(

                                      GVar.notes[index].description.substring(0,GVar.end[index]),
                                      style: TextStyle(
                                        fontSize: 15.0
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(3.0))
                                      ),
                                      padding: EdgeInsets.all(2.0),

                                      child: Text("Edit",
                                        style: TextStyle(
                                          color: Colors.white
                                        ),
                                      ),
                                      color: Colors.redAccent,
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context){return Edit(index);}
                                        ));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    );
                  }
              )
            ),
          )
    ]
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height-80 );

    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height-80 );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
