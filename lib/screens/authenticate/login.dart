import 'package:flutter/material.dart';
import 'package:octave/screens/authenticate/togglePage.dart';
import 'package:octave/screens/home/calendar.dart';
import 'package:octave/screens/home/home.dart';
import 'package:octave/services/auth.dart';
import 'package:octave/shared/loading.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth=AuthService();
  bool loading=false;

  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Color(0xFFEDDEE3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 3),
          Align(
            child: Image(image: AssetImage('asset/logo.jpg'),
              width: 95,
              height: 95,
            ),
            alignment: Alignment.center,
          ),
          Spacer(flex:1),
          Align(
            child: Text('LOG IN',
              style: TextStyle(
                color: Color(0xFF40826D),
                fontSize: 35.0,
                fontFamily: 'OldStandardTT',
                fontWeight: FontWeight.w500,
                letterSpacing: 3.5,
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
          Spacer(flex: 2),
          Align(
            child:Text("               E-MAIL",
                  style: TextStyle(
                    color: Color(0xFF40826D),
                    fontSize: 20.0,
                    fontFamily: 'Khand',
                    fontWeight: FontWeight.w500,
                  ),),
            alignment: Alignment.centerLeft,
          ),

          Align(
                  child: SizedBox(
                    width:250,
                    height: 40,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF40826D),
                        fontSize: 17.5,
                        fontFamily: 'OldStandardTT',
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: (val){
                        setState(()=>email=val);
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
                        fillColor:Color(0xFFD3D3D3).withOpacity(0.7),
                        hintText: '  example@email.com',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OldStandardTT',
                            color: Color(0xFF3F3F3F).withOpacity(0.7),
                          )

                      ),

                    ),

                  ),
            alignment: Alignment.center,
                ),
          Container(
              height: 15
          ),
          Align(
            child:Text("               PASSWORD",
                  style: TextStyle(
                    color: Color(0xFF40826D),
                    fontSize: 20.0,
                    fontFamily: 'Khand',
                   // fontWeight: FontWeight.w500,
                  ),),
            alignment: Alignment.centerLeft,
          ),
                Align(
                  child: SizedBox(
                    width:250,
                    height: 40,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        color: Color(0xFF40826D),
                        fontSize: 18.0,
                        fontFamily: 'OldStandardTT',
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: (val){
                        setState(()=>password=val);
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
                          hintText: '  password',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OldStandardTT',
                            color: Color(0xFF3F3F3F).withOpacity(0.7),
                          )

                      ),

                    ),

                  ),
                  alignment: Alignment.center,
                ),

          Spacer(flex: 1),

          Row(
            children: [
              Container(
                width:MediaQuery.of(context).size.width/9.5,
              ),
              Align(
                child: TextButton(
                    onPressed: () async{
                        setState(()=>loading=true);
                        dynamic result=await _auth.loginwithEmail(email, password);
                        if (result==null)
                          {
                            print('Error');
                            setState(()=>loading=false);
                          }
                        else {
                          print(email);
                          print(password);
                          print('signed in');
                          String user = result.uid;
                          user = '3lMlUJKHgaOEBpSrQ6CjTF1VlKk2';
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Calendar();
                              }));
                          print('hi');

                          print('Hello');
                        }},

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

              Container(
                  width: 10
              ),

              Align(
                child: TextButton(
                    onPressed: (){

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return Toggle();
                          }));
                    },
                    child: Text("HOME",
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
                          //fontWeight: FontWeight.w300,
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
          Spacer(flex: 5),
        ],
      )

    );
  }
}