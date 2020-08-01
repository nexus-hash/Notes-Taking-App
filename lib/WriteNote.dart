import 'package:flutter/material.dart';
import 'package:flutter_app/GlobalVariables/GlobalVar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NoteTaking extends StatefulWidget {
  @override
  _NoteTakingState createState() => _NoteTakingState();
}

class _NoteTakingState extends State<NoteTaking> {


  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(

          children: <Widget>[
            Positioned(
              top:MediaQuery.of(context).size.height*0.42,
              right: -MediaQuery.of(context).size.width*.05,
              child: Transform.rotate(
                angle: 3.14*3/2,
                child: ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height * .17,
                    color: Colors.red,
                  ),
                  clipper: CustomClipPath(),
                ),
              )
            ),
            Positioned(
                top:MediaQuery.of(context).size.height*0.425,
                right: -MediaQuery.of(context).size.width*.05,
                child: Transform.rotate(
                  angle: 3.14*3/2,
                  child: ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.height,
                      height: MediaQuery.of(context).size.height * .15,
                      color: Colors.black,
                    ),
                    clipper: CustomClipPath(),
                  ),
                )
            ),
            Positioned(
                top:MediaQuery.of(context).size.height*0.435,
                right: -MediaQuery.of(context).size.width*.05,
                child: Transform.rotate(
                  angle: 3.14*3/2,
                  child: ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.height,
                      height: MediaQuery.of(context).size.height * .13,
                      color: Colors.redAccent.withOpacity(0.5),
                    ),
                    clipper: CustomClipPath(),
                  ),
                )
            ),
            Positioned(
              top: 0.0,
              right: -MediaQuery.of(context).size.width*.019,
              child: Container(

                width: MediaQuery.of(context).size.width*.74,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        width: MediaQuery.of(context).size.width*.74,
                        height:  MediaQuery.of(context).size.height*.12,

                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: MediaQuery.of(context).size.width*0.05,
                              top: MediaQuery.of(context).size.height*0.035,
                              child: Text(GVar.title,style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontFamily: 'Nicholia'
                              ),),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width*0.6,
                              top: MediaQuery.of(context).size.height*0.04,
                              child: IconButton(icon: Icon(MdiIcons.contentSaveAllOutline,color: Colors.white,), onPressed: (){}),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height*0.91,
                      child: Container(
                        width: MediaQuery.of(context).size.width*.74,
                        height:  MediaQuery.of(context).size.height*.08,
                        color: Colors.indigo,
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Content",
                              hintStyle: TextStyle(
                                color: Colors.white
                              )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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