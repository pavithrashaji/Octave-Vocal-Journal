import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octave/screens/home/entrylist.dart';
import 'package:octave/screens/home/favlist.dart';
import 'package:octave/screens/home/list.dart';
import 'package:octave/screens/home/setting.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:octave/models/user.dart';


CalendarFormat format = CalendarFormat.month;
DateTime _selectedDay = DateTime.now();
DateTime _focusedDay = DateTime.now();
Color a = Color(0xFFEDDEE3);
Color b = Color(0xFF002C23);
Color c = Color(0xFF000F0B);
Color d = Color(0xFFB3CDC5);
Color e = Color(0xFF40826D);
bool val = true;

/*class CalendarPage extends StatelessWidget {

  final String user;
  CalendarPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calendar(user:user),
    );
  }
}*/

class Calendar extends StatefulWidget{

  @override
  State<Calendar> createState()=>_CalendarState();

}

class _CalendarState extends State<Calendar> {
  String date1 = "${_selectedDay.day}";
  String week1 = "${_selectedDay.weekday}";
  String week2 = '';
  String name='';

  final CollectionReference userCollection=FirebaseFirestore.instance.collection('users');
  final FirebaseAuth auth=FirebaseAuth.instance;

  _CalendarState()
  {
    change();
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
    User? user= auth.currentUser;


    final docRef = userCollection.doc(user?.uid);
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        name=data['fname'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
    print(name);

   /* userCollection.doc('${widget.user}').get().then((value){
      setState(({
        name=value.data['name'].toString();
      }));
    });*/
  }
  Widget build(BuildContext context){
    return Scaffold(
      body:
      Stack(
        children: [
          Positioned( //<-- SEE HERE
            right: 30,
            top: 60,
            child: Container(
              alignment: Alignment.center,
              width: 270,
              height: 70,
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

            ),
          ),

          Positioned( //<-- SEE HERE
            left: 25,
            top: 60,
            child: Container(
              alignment: Alignment.center,
              width: 70,
              height:70,
              child: Text(
                week2,
                //'FRI \n29',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontFamily: 'OldStandardTT',
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
            left: 144,
            bottom: 42,
            child: Icon(
                Icons.circle,
                color: val? e : d,
                size: 70.0
            ),
          ),

          Positioned( //sLOGO
            left: 153,
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

                      },
                    ),

                    IconButton(
                      color: val? e : d,
                      iconSize: 34.0,
                      onPressed: () {
                        val = !val;
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return Calendar();
                            }));
                      },
                      icon: val ? Icon(Icons.nightlight_round_rounded) : Icon(Icons.sunny),

                    ),

                    IconButton(
                      icon: Icon(Icons.settings),
                      color: val? e : d,
                      iconSize: 34.0,
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


          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox (
                  width: 310,

                  child:
                  TableCalendar(
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    focusedDay: DateTime.now(),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    daysOfWeekHeight: 35,
                    selectedDayPredicate: (day) {
                      var formattedDate = "${_selectedDay.day}-${_selectedDay.month}-${_selectedDay.year}";
                      print(formattedDate);
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return EntryL();
                            }));// update `_focusedDay` here as well
                      });
                    },
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle:
                      TextStyle(
                        color: val? e : d,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Khand',
                        letterSpacing: 1.5,
                        //textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          color: val? a : c,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      formatButtonTextStyle:
                      TextStyle(color: val? a : c, fontSize: 16.0,fontFamily: 'OldStandardTT'),
                      formatButtonDecoration: BoxDecoration(
                        color: val? a : c,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ), ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: val? e : d,
                        size: 40,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: val? e : d,
                        size: 40,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date)[0],
                      // Weekend days color (Sat,Sun)
                      decoration: BoxDecoration(
                        color: val? d : b,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: val? d : b,
                          width: 15,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      weekdayStyle: TextStyle(color: val? e : d, fontSize: 17, fontFamily: 'OldStandardTT',  fontWeight: FontWeight.w500,),
                      weekendStyle: TextStyle(color: val? e : d, fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'OldStandardTT'),

                    ),
                    calendarStyle: CalendarStyle(
                      // Weekend dates color (Sat & Sun Column)
                      defaultTextStyle: TextStyle(color: val? e : d, fontSize: 20,fontFamily: 'OldStandardTT', fontWeight: FontWeight.w500),
                      weekendTextStyle: TextStyle(color: val? e : d, fontSize: 20,fontFamily: 'OldStandardTT', fontWeight: FontWeight.w500),
                      // highlighted color for today
                      selectedTextStyle: TextStyle(color: val? e : d, fontSize: 19,fontFamily: 'OldStandardTT', fontWeight: FontWeight.w500),
                      todayTextStyle: TextStyle(color: val? e : d, fontSize: 19,fontFamily: 'OldStandardTT', fontWeight: FontWeight.w500),
                      selectedDecoration: BoxDecoration(
                        color: val? a : c,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: val? e : d,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      todayDecoration:
                      BoxDecoration(
                        color: val? a : c,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: val? e : d,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4), // changes position of shadow
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: val? a : c,

    );
  }



}