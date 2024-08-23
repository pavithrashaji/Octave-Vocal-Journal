import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:octave/screens/authenticate/togglePage.dart';
import 'package:octave/screens/home/entrylist.dart';
import 'package:octave/services/auth.dart';


class Diary extends StatefulWidget {

  @override
  State<Diary> createState() => _DiaryP();
}

class _DiaryP extends State<Diary> {
  final _formKey=GlobalKey<FormState>();
  //String user='3lMlUJKHgaOEBpSrQ6CjTF1VlKk2';
  String text='';
  String formattedDate='';
  String formattedDay='';
  String formattedTime='';


  _DiaryP()
  {
    DateTime now=DateTime.now();
    //final DateFormat formatter = DateFormat.E().format(now);
    formattedDay= DateFormat.yMMMMd().format(now);
    formattedDay= DateFormat.EEEE().format(now);
    formattedTime=DateFormat.Hms().format(now);



  }

  final CollectionReference entryCollection=FirebaseFirestore.instance.collection('users');
  final FirebaseAuth auth=FirebaseAuth.instance;

  TextEditingController diaryText = TextEditingController();
  Widget build(BuildContext)=>Scaffold(
    backgroundColor: Color(0xFFEDDEE3),
    body: Column(
      key: _formKey,
      mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[

        Container(
          height: 60,
        ),

        Align(
          child: Text('LOG YOUR ENTRY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Khand',
              color: Color(0xFF40826D),
              fontSize: 28,
              //fontWeight: FontWeight.bold,
            ),),

        ),
        Container(
          width: MediaQuery.of(context).size.width/1.2,
          height:300,
          child:TextFormField(
              style: TextStyle(
                color: Color(0xFF40826D),
                fontSize: 18.0,
                fontFamily: 'Khand',
                fontWeight: FontWeight.w500,
              ),
            maxLines:12,

              decoration:InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                filled: true,
                fillColor: Color(0xFFD3D3D3).withOpacity(0.7),
                hintText: ' Enter your text here...',

              ),
              controller:diaryText,
              onChanged: (val){
                setState(()=>text=val);
              }

          ),

        ),
        Container(
          height:10
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: (){

                    User? user= auth.currentUser;

                    entryCollection.doc(user?.uid).collection("entry").add({
                      'uid':user?.uid,
                      'date':DateTime.now(),
                      'text':text,
                      'fav':false
                    }
                    ).then((value) => print(value.id)).catchError((error)=>print("Failed to add user"));

entryCollection.add({
                      'uid':user,
                      'date':DateTime.now(),
                      'text':text
                    }
                    ).then((value) => print(value.id)).catchError((error)=>print("Failed to add user"));

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return EntryL();}));
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return EntryL();}));
                    },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF40826D).withOpacity(0.8)),
                      fixedSize: MaterialStateProperty.all(Size(135.0, 47.0)),
                      shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      ))
                  ),
                  child: Text("SAVE",
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
                      ))
              ),
            ),
            Container(
              width: 10,
            ),
            Align(
              child: TextButton(
                  onPressed: (){
                    diaryText.clear();
                  },
                  child: Text("CLEAR",
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
                      backgroundColor: MaterialStateProperty.all(Color(0xFF40826D).withOpacity(0.8)),
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
        Container(
          height: 50,
        )
      ],
    )


  );}
