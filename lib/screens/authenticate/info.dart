import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octave/screens/authenticate/togglePage.dart';
import 'package:octave/screens/home/home.dart';
import 'package:octave/services/auth.dart';
import 'package:octave/shared/loading.dart';

import '../home/calendar.dart';


final FirebaseAuth auth=FirebaseAuth.instance;
class Info extends StatefulWidget {

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  final CollectionReference userCollection=FirebaseFirestore.instance.collection('users');
  bool loading=false;

  User? user= auth.currentUser;

  String fname='';
  String lname='';
  String age='';
  String gender='';

  TextEditingController fnameText = TextEditingController();
  TextEditingController lnameText = TextEditingController();
  TextEditingController ageText = TextEditingController();
  TextEditingController genderText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Color(0xFFEDDEE3),
      body: Column(
          key: _formKey,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 3),
            Align(
              child: Image(image: AssetImage('asset/logo.jpg'),
                width: 80,
                height: 80,),
              alignment: Alignment.center,
            ),
            Spacer(flex:1),
            Align(
              child: Text('PERSONAL INFO',
                style: TextStyle(
                  color: Color(0xFF40826D),
                  fontSize: 30.0,
                  fontFamily: 'OldStandardTT',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.5,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3,3),
                      blurRadius: 10,
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                    ),
                  ],
                ),),
              alignment: Alignment.center,
            ),
            Spacer(flex: 2,),
            Column(
              children: [

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("               FIRST NAME",
                    style: TextStyle(
                      color: Color(0xFF40826D),
                      fontSize: 20,
                      fontFamily: 'Khand',
                      fontWeight: FontWeight.w500,
                    ),),
                ),
                Align(
                    child:SizedBox(
                      width:250,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Color(0xFF40826D),
                          fontSize: 18,
                          fontFamily: 'Khand',
                          fontWeight: FontWeight.w500,
                        ),
                        controller: fnameText,
                        validator: (val)=>(val!.isEmpty)?'Enter a name':null,
                        onChanged: (val){
                          setState(()=>fname=val);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFD3D3D3).withOpacity(0.7),
                          hintText: '  first name',

                        ),

                      ),

                    )

                ),

                Container(
                    height: 10
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("               LAST NAME",
                    style: TextStyle(
                      color: Color(0xFF40826D),
                      fontSize: 20,
                      fontFamily: 'Khand',
                      fontWeight: FontWeight.w500,
                    ),),
                ),
                Align(
                    child:SizedBox(
                      width:250,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Color(0xFF40826D),
                          fontSize: 18,
                          fontFamily: 'Khand',
                          fontWeight: FontWeight.w500,
                        ),
                        controller: lnameText,
                        validator: (val)=>(val!.isEmpty)?'Enter a name':null,
                        onChanged: (val){
                          setState(()=>lname=val);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFD3D3D3).withOpacity(0.7),
                          hintText: '  last name',

                        ),

                      ),

                    )

                ),

                Container(
                    height: 10
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("               AGE",
                      style: TextStyle(
                        color: Color(0xFF40826D),
                        fontSize: 20,
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.w500,
                      ),)
                ),
                Align(
                    child:SizedBox(
                      width:250,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Color(0xFF40826D),
                          fontSize: 18,
                          fontFamily: 'Khand',
                          fontWeight: FontWeight.w500,
                        ),
                        controller: ageText,
                        validator: (val)=>(val!.isEmpty)?'Enter correct age':null,
                        onChanged: (val){
                          setState(()=>age=val);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFD3D3D3).withOpacity(0.7),
                          hintText: '  age',

                        ),

                      ),

                    )

                ),

                Container(
                    height: 10
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("               GENDER",
                      style: TextStyle(
                        color: Color(0xFF40826D),
                        fontSize: 20,
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.w500,
                      ),)
                ),
                Align(


                    child:SizedBox(
                      width:250,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Color(0xFF40826D),
                          fontSize: 18,
                          fontFamily: 'Khand',
                          fontWeight: FontWeight.w500,
                        ),
                        onChanged: (val){
                          setState(()=>gender=val);
                        },
                        controller: genderText,
                        validator: (val)=>(val!.isEmpty)?'Enter gender':null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFD3D3D3).withOpacity(0.7),
                          hintText: '  gender',

                        ),

                      ),

                    )

                ),
              ],
            ),

            Spacer(flex:2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: TextButton(
                      onPressed: ()  async{
                        userCollection.doc(user?.uid).update({
                          'fname':fname,
                          'lname':lname,
                          'age':age,
                          'gender':gender,
                        });


                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return Calendar();}));


                      },
                      child: Text("SUBMIT",
                          style: TextStyle(
                            color: Color(0xFFEDDEE3),
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.5, 2.5),
                                blurRadius: 8.0,
                                color: Color(0xFF000000).withOpacity(0.3),
                              ),
                            ],
                            fontSize: 23.0,
                            fontFamily: 'Khand',
                            //fontWeight: FontWeight.w100,
                          )),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFF40826D).withOpacity(0.9)),
                          fixedSize: MaterialStateProperty.all(Size(135.0, 47.0)),
                          shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ))
                      )
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
            Spacer(flex: 5,),

          ]
      ),
    );
  }
}