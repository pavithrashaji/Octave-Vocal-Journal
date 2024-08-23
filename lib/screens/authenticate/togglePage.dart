import 'package:flutter/material.dart';
import 'package:octave/screens/authenticate/authenticate.dart';
import 'package:octave/screens/authenticate/login.dart';
import 'package:octave/screens/authenticate/signup.dart';

class Toggle extends StatefulWidget {
  @override
  State<Toggle> createState() => ToggleState();
}

class ToggleState extends State<Toggle> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDDEE3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 6),
          Align(
            child: Image(image: AssetImage('asset/logo.jpg'),
              width: 120,
              height: 120,),
            alignment: Alignment.center,
          ),
          Align(
            child: Text('octave',
              style: TextStyle(
                color: Color(0xFF40826D),
                fontSize: 70.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.5, 2.5),
                    blurRadius: 5.0,
                    color: Color(0xFF909090),
                  ),
                ],
              ),),
            alignment: Alignment.center,
          ),
          Spacer(flex: 3),
          Align(
            child: TextButton(
                onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(
                                  builder: (context){
                                  return Login();}));
                },
                child: Text("LOG IN",
                    style: TextStyle(
                      color: Color(0xFFEDDEE3),
                      fontSize: 30.0,
                      fontFamily: 'Khand',
                      fontWeight: FontWeight.w300,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.5, 2.5),
                          blurRadius: 8.0,
                          color: Color(0xFF000000).withOpacity(0.3),
                        ),
                      ],
                    )),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF40826D).withOpacity(0.9)),
                    fixedSize: MaterialStateProperty.all(Size(200.0, 60.0)),
                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ))
                )
            ),
            //alignment: Alignment.center,
          ),
          Container(
              height: 10
          ),
          Align(
            child: TextButton(
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return SignUp();}));
              },
              child: Text("SIGN UP",
                  style: TextStyle(
                    color: Color(0xFFEDDEE3),
                    fontSize: 30.0,
                    fontFamily: 'Khand',
                    fontWeight: FontWeight.w300,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.5, 2.5),
                        blurRadius: 8.0,
                        color: Color(0xFF000000).withOpacity(0.3),
                      ),
                    ],
                  )),

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF40826D).withOpacity(0.9)),
                  fixedSize: MaterialStateProperty.all(Size(200.0, 60.0)),
                  shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ))

              ),

            ),
            //alignment: Alignment.center,
          ),
          Spacer(flex: 5),

        ],

      ),
    );
  }
}