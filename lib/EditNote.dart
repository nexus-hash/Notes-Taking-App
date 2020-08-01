import 'package:flutter/material.dart';
import 'package:flutter_app/GlobalVariables/GlobalVar.dart';
import 'package:flutter_app/GlobalVariables/dbutils.dart';
import 'package:flutter_app/Ifloggedin.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();

  int indexi;

  Edit(int index){
    indexi = index;
  }
}

class _EditState extends State<Edit> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController ;
  String TempDescription =  "";


  @override
  void initState(){
    nameController = new TextEditingController(text: DbUtils.notes[widget.indexi].description);
  }

  String temp = "";
  createAlertDialog2(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Text("Delete Current Note",style: TextStyle(color: Colors.white),),

            actions: <Widget>[
              RaisedButton(
                onPressed: () => {
                  Navigator.of(context, rootNavigator: true).pop('dialog')
                },
                child: Text("Cancel"),
              ),
              RaisedButton(
                color: Colors.black87,
                onPressed: () async {

                  await DbUtils.deleteData(DbUtils.notes[widget.indexi].title);
                  await DbUtils.getList();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){return LoggedIn();}
                  ));
                },
                child: Text("Confirm"),
              )
            ],
          );
        });
  }

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
                      child: Align(
                        alignment: Alignment.center,
                        child: Transform.rotate(
                          angle: 3.14/2,
                          child: IconButton(icon:Icon(Icons.delete,color: Colors.white,size: 30.0,),
                          onPressed: (){
                            createAlertDialog2(context);
                          },),
                        ),
                      ),
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
                              child: Text(GVar.Title,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontFamily: 'Nicholia'
                              ),),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width*0.6,
                              top: MediaQuery.of(context).size.height*0.04,
                              child: IconButton(icon: Icon(MdiIcons.contentSaveAllOutline,color: Colors.white,), onPressed: ()async{
                                GVar.Description=TempDescription;
                                await DbUtils.updateData(GVar.Title, GVar.Description);
                                await DbUtils.getList();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){return LoggedIn();}
                                ));
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height*0.12,
                      child: Container(
                        width: MediaQuery.of(context).size.width*.74,
                        height:  MediaQuery.of(context).size.height*.88,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 20000,
                                controller: nameController,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0
                                ),
                                decoration: InputDecoration(
                                    hintText: "Enter Content",
                                    hintStyle: TextStyle(
                                        color: Colors.white
                                    )
                                ),
                                onChanged: (temp){
                                  TempDescription = temp;
                                },
                              ),
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