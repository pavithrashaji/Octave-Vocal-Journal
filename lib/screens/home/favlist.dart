import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octave/screens/home/calendar.dart';
import 'package:octave/screens/home/entrylist.dart';
import 'package:octave/screens/home/list.dart';
import 'package:octave/screens/home/setting.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


final CollectionReference userCollection=FirebaseFirestore.instance.collection('users');
final FirebaseAuth auth=FirebaseAuth.instance;
CalendarFormat format = CalendarFormat.month;
DateTime _selectedDay = DateTime.now();
DateTime _focusedDay = DateTime.now();
Color a = Color(0xFFEDDEE3);
Color b = Color(0xFF002C23);
Color c = Color(0xFF000F0B);
Color d = Color(0xFFB3CDC5);
Color e = Color(0xFF40826D);
bool val = true;

class FavListP extends StatefulWidget{

  @override
  State<FavListP> createState()=>_FavListState();

}

class _FavListState extends State<FavListP> {
  String date1 = "${_focusedDay.day}";
  String week1 = "${_focusedDay.weekday}";
  String week2 = '';
  String name='';

  _ListState()
  {
    change();
    //addwidget();
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
    print(week2);
    print(date1);
    print(week1);
    User? user= auth.currentUser;


    final docRef = userCollection.doc(user?.uid);
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        name=data['fname'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
  List<Object> _entryList=[];


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    getentryList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              )
          ),

          Positioned( //<-- SEE HERE
            left: 25,
            top: 60,
            child: Container(
              alignment: Alignment.center,
              width: 70,
              height: 70,
              child: Text(
                'MON\n1',
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
            left: 7,
            bottom: 44,
            child: Icon(
                Icons.circle,
                color: val? e : d,
                size: 70.0
            ),
          ),

          Positioned( //sLOGO
            left: 15,
            bottom: 46,
            child: Icon(
                Icons.circle,
                color: val? a : c,
                size: 58.0
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 0,
                width: 200,
              ),
              Row(
                  children: [
                    Container(
                      height: 400,
                      width: 18,
                    ),
                    Container(
                      height: 430,
                      width: 320,
                      child: ListView.builder(
                        itemCount: _entryList.length,
                        itemBuilder: (context, index){
                          return EntryCard(_entryList[index] as Entry);

                        },
                        /*shrinkWrap: true,
                        padding: EdgeInsets.all(8),
                        children: <Widget>[
                          for(int i=1; i<=5; i++)
                            Column(
                              children: [ Container(
                                width: 300,
                                height: 100,
                                //color: val? d : b,
                                child: Text(
                                    '\nHi this is Test Case',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: val? e : d,
                                      fontFamily: 'OldStandardTT',
                                    )
                                ),
                                decoration: BoxDecoration(
                                  color: val? d : b.withOpacity(0.5),
                                  border: Border.all(
                                    color: val? d : b,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                                Container(
                                  height: 6,
                                  width: 18,
                                ),
                              ],
                            ),
                        ],*/

                      ),
                    ),
                  ]
              ),
            ],
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
                              return FavListP();
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
                              return Setting();}));

                      },
                    ),
                  ]
              ),
              Container(
                height: 50,
              )
            ],
          ),


        ],
      ),
      backgroundColor: val? a : c,
    );
  }
  Future getentryList() async
  {
    User? user= auth.currentUser;
    var data= await FirebaseFirestore.instance.collection('users').
    doc(user?.uid).collection('entry').where('fav',isEqualTo: true).get();


    setState((){
      _entryList=List.from(data.docs.map((doc)=>Entry.fromSnapshot(doc)));

    });
  }

}


class Entry{
  String? uid;
  String? text;
  DateTime? date;
  bool? fav;
  String? data;

  Entry();
  Map<String, dynamic> toJson()=>{'uid':uid,'text':text,'date':date,'fav':fav};

  Entry.fromSnapshot(snapshot)
      :uid=snapshot.data()['uid'],
        text=snapshot.data()['text'],
        date=snapshot.data()['date'].toDate(),
        fav=snapshot.data()['fav'];

}

class EntryCard extends StatelessWidget {

  final Entry _entry;
  User? user=auth.currentUser;
  final CollectionReference entryCollection=FirebaseFirestore.instance.collection('users');

  EntryCard(this._entry);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${DateFormat.Hms().format(_entry.date!).toString()}"),
                  IconButton(
                    onPressed:(){

                      bool val;

                      final post= entryCollection.doc(user?.uid).collection('entry')
                          .where("date",isEqualTo: _entry.date!).where("text",isEqualTo: _entry.text).get()
                          .then((value){
                        value.docs.forEach((element) {
                          Map <String,dynamic> obj=element.data();
                          val=obj['fav'];
                          entryCollection.doc(user?.uid).collection('entry').doc(element.id).update(
                              {
                                "fav":!val
                              });
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return FavListP();}));
                        });
                      });


                    },
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: !_entry.fav!?Icon(Icons.favorite_border_outlined):Icon(Icons.favorite_rounded),
                    iconSize: 20,

                    color:Colors.red,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 12.0)),
              Row(
                children: [
                  Expanded(
                    child: Text(_entry.text!,
                    ),
                  ),
                ],
              )

            ],
          ),
        ),


      ),
    );
  }
}
