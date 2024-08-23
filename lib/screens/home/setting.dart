import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octave/screens/home/calendar.dart';
import 'package:octave/screens/home/changepass.dart';
import 'package:octave/screens/home/editprofile.dart';
import 'package:octave/screens/home/favlist.dart';
import 'package:octave/screens/home/list.dart';
import 'package:octave/screens/wrapper.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


CalendarFormat format = CalendarFormat.month;
DateTime _selectedDay = DateTime.now();
DateTime _focusedDay = DateTime.now();
Color a = Color(0xFFEDDEE3);
Color b = Color(0xFF002C23);
Color c = Color(0xFF000F0B);
Color d = Color(0xFFB3CDC5);
Color e = Color(0xFF40826D);
bool val = true;



class Setting extends StatefulWidget{
  @override
  State<Setting> createState()=>_SettingState();

}

class _SettingState extends State<Setting> {
  String date1 = "${_focusedDay.day}";
  String week1 = "${_focusedDay.weekday}";
  String week2 = '';

  final CollectionReference userCollection=FirebaseFirestore.instance.collection('users');
  final FirebaseAuth auth=FirebaseAuth.instance;

  _SettingState()
  {
    change();
    //formatstring();
  }

  void change()
  {
    if(week1=='1')
    {
      week2='MON'+'\n'+date1;
    }
    else if(week1=='2')
    {
      week2='TUE'+'\n'+date1;
    }
    else if(week1=='3')
    {
      week2='WED'+'\n'+date1;
    }
    else if(week1=='4')
    {
      week2='THU'+'\n'+date1;
    }
    else if(week1=='5')
    {
      week2='FRI'+'\n'+date1;
    }
    else if(week1=='6')
    {
      week2='SAT'+'\n'+date1;
    }
    else if(week1=='7')
    {
      week2='SUN'+'\n'+date1;
    }



  }
  List<Object> _entryList=[];




  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned( //<-- SEE HERE
              left: MediaQuery.of(context).size.width/5.2,
              top: MediaQuery.of(context).size.height/10.9,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/1.4,
                height: MediaQuery.of(context).size.height/11.3,
                child: Text(
                  '  good morning',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'OldStandardTT',
                    letterSpacing: 1.5,
                    color: val? e : d,
                  ),
                ),
                decoration: BoxDecoration(
                  color: val? d : b,
                  border: Border.all(
                    color: val? d : b,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                ),
              )
          ),

          Positioned( //<-- SEE HERE
            left: MediaQuery.of(context).size.width/11,
            top: MediaQuery.of(context).size.height/10.9,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.height/11.3,
              height:MediaQuery.of(context).size.height/11.3,
              child: Text(
                'MON\n1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  //fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontFamily: 'BebasNeue',
                  color: val? d : b,
                ),
              ),
              decoration: BoxDecoration(
                color: val? e : d,
                border: Border.all(
                  color: val? e : d,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(2, 2), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),

          Positioned( //bLOGO
            left: MediaQuery.of(context).size.width/1.293,
            bottom: 42,
            child: Icon(
                Icons.circle,
                color: val? e : d,
                size: 70.0
            ),
          ),

          Positioned( //sLOGO
            left: MediaQuery.of(context).size.width/1.248,
            bottom: 44,
            child: Icon(
                Icons.circle,
                color: val? a : c,
                size: 58.0
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      color: val? e : d,
                      iconSize: 34.5,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return FavListP();
                            }));

                      },
                    ),

                    IconButton(
                        icon: Icon(Icons.list),
                        color: val? e : d,
                        iconSize: 35.0,
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return ListP();
                              }));
                        }
                    ),

                    IconButton(
                      icon: Icon(Icons.home),
                      color: val? e : d,
                      iconSize: 35.0,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return Calendar();
                            }));
                      },
                    ),

                    IconButton(
                      color: val? e : d,
                      iconSize: 34.0,
                      onPressed: () {
                        val = !val;
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return Setting();
                            }));
                      },
                      icon: val ? Icon(Icons.nightlight_round_rounded) : Icon(Icons.sunny),
                    ),

                    IconButton(
                      icon: Icon(Icons.settings),
                      color: val? e : d,
                      iconSize: 32.0,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return Setting();
                            }));
                      },
                    ),
                  ]
              ),
              Container(
                height: 50,
              )
            ],
          ),

         /* Positioned(
            top: MediaQuery.of(context).size.height/3.9,
            left: MediaQuery.of(context).size.width/8.7,
            child: Container(
                width: MediaQuery.of(context).size.width/1.3,
                height: MediaQuery.of(context).size.height/3.5,
                decoration: BoxDecoration(
                  color: val? a : c,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  border: Border.all(
                    color: val? d : b,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*Text(
                        'A C C O U N T   I N F O',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: val? e : d,
                            fontFamily: 'Khand',
                          )
                      ),*/
                    Container(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text(  //label
                            '       FIRST NAME',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              color: val? e : d,
                              fontFamily: 'Khand',
                            )
                        ),

                          Text(  //label
                              'LAST NAME              ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: val? e : d,
                                fontFamily: 'Khand',
                              )
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text(  //info

                            _entry.fname!.padLeft(25,' '),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'Khand',
                            )
                        ),

                          Text(  //info
                              _entry.lname!.padRight(27,' '),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'Khand',
                              )
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text(  //label
                            '                   AGE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              color: val? e : d,
                              fontFamily: 'Khand',
                            )
                        ),

                          Text(  //label
                              'GENDER                        ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: val? e : d,
                                fontFamily: 'Khand',
                              )
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text(  //info
                            _entry.age!.padLeft(24,' '),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'Khand',
                            )
                        ),

                          Text(  //info
                              _entry.gender!.padRight(24,' '),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontFamily: 'Khand',
                              )
                          ),
                        ],
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ Text(  //label
                          'E-MAIL',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: val? e : d,
                            fontFamily: 'Khand',
                          )
                      ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(  //info
                            _entry.email!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'Khand',
                            )
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),*/

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
              ),
              /*Align(
                child: TextButton(
                    onPressed: () { /*async{
                        setState(()=>loading=true);
                        dynamic result=await _auth.loginwithEmail(email, password);
                        if (result==null)
                          {
                            print('Error');
                            setState(()=>loading=false);
                          }
                        else
                          {
                            print(email);
                            print(password);
                            print('signed in');
                            String user=result.uid;
                            user='3lMlUJKHgaOEBpSrQ6CjTF1VlKk2';
*/
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return EditP();}));


                      print('hi');
                      print('Hello');
                    },

                    child: Text("EDIT PROFILE",
                        style: TextStyle(
                          color: val? e : d,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.5, 2.5),
                              blurRadius: 8.0,
                              color: Color(0xFF000000).withOpacity(0.3),
                            ),
                          ],
                          fontSize: 21.0,
                          fontFamily: 'Khand',
                          //fontWeight: FontWeight.w100,
                        )),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(val? d : b.withOpacity(0.6)),
                        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 44.0)),
                        shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)
                        ))
                    )
                ),
                alignment: Alignment.center,
              ),*/

              Container(
                  width: 10
              ),



              Align(

                child: TextButton(
                    onPressed: (){

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return ChangeP();
                          }));


                    },
                    child: Text("CHANGE PASSWORD",
                        style: TextStyle(
                          color: val? e : d,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.5, 2.5),
                              blurRadius: 8.0,
                              color: Color(0xFF000000).withOpacity(0.3),
                            ),
                          ],
                          fontSize: 21.0,
                          fontFamily: 'Khand',
                          //fontWeight: FontWeight.w300,
                        )),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(val? d : b.withOpacity(0.6)),
                        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 44.0)),
                        shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)
                        ))
                    )
                ),
                //alignment: Alignment.center,
              ),

              Container(
                height: 20,
              ),
              Positioned(
                //alignment: Alignment.center,
                child: TextButton(
                    onPressed: () { /*async{
                        setState(()=>loading=true);
                        dynamic result=await _auth.loginwithEmail(email, password);
                        if (result==null)
                          {
                            print('Error');
                            setState(()=>loading=false);
                          }
                        else
                          {
                            print(email);
                            print(password);
                            print('signed in');
                            String user=result.uid;
                            user='3lMlUJKHgaOEBpSrQ6CjTF1VlKk2';
*/
                     Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return Wrapper();}));


                      print('hi');

                      print('Hello');



                    },

                    child: Text("LOG OUT",
                        style: TextStyle(
                          color: val? e : d,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.5, 2.5),
                              blurRadius: 8.0,
                              color: Color(0xFF000000).withOpacity(0.3),
                            ),
                          ],
                          fontSize: 21.0,
                          fontFamily: 'Khand',
                          //fontWeight: FontWeight.w100,
                        )),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(val? d : b.withOpacity(0.6)),
                        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 44.0)),
                        shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)
                        ))
                    )
                ),
              ),

              Container (
                height: 170,
              )
            ],
          ),
       ],
      ),
      backgroundColor: val? a : c,
    );


  }
  /*Future getentryList() async
  {
    User? user= auth.currentUser;
    var data= await FirebaseFirestore.instance.collection('users').
    doc(user?.uid).collection('entry')
        .orderBy("date",descending: true).get();

    setState((){
      _entryList=List.from(data.docs.map((doc)=>Entry.fromSnapshot(doc)));

    });
  }

   */

}

