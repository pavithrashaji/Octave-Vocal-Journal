import 'package:flutter/material.dart';
import 'package:octave/screens/authenticate/info.dart';
import 'package:octave/screens/authenticate/togglePage.dart';
import 'package:octave/screens/home/home.dart';
import 'package:octave/services/auth.dart';
import 'package:octave/shared/loading.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;

  String email='';
  String password='';
  String conpass='';
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController conpassText = TextEditingController();

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
              width: 90,
              height: 90,),
            alignment: Alignment.center,
          ),
          Spacer(flex:1),
          Align(
            child: Text('SIGN UP',
              style: TextStyle(
                color: Color(0xFF40826D),
                fontSize: 35.0,
                fontFamily: 'OldStandardTT',
                fontWeight: FontWeight.w500,
                letterSpacing: 3.5,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 10,
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                  ),
                ],
              ),),
            alignment: Alignment.center,
          ),

          Spacer(flex: 1),

          Column(
            children: [ Align(
                alignment: Alignment.centerLeft,
                child: Text("               E-MAIL",
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
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Color(0xFF40826D),
                        fontSize: 18,
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: (val){
                        setState(()=>email=val);
                      },
                      controller: emailText,
                      validator: (val)=>(val!.isEmpty)?'Enter correct email':null,
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
                        hintText: '  example@email.com',
                      ),
                    ),
                  )
              ),
              Container(
                  height: 10
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("               PASSWORD",
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
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        color: Color(0xFF40826D),
                        fontSize: 18,
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: (val){
                        setState(()=>password=val);
                      },
                      validator: (val)=>(val!.isEmpty)?'Enter correct password':null,
                      controller: passwordText,
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

                      ),
                    ),
                  )
              ),
              Container(
                  height: 10
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("               CONFIRM PASSWORD",
                    style: TextStyle(
                      color: Color(0xFF40826D),
                      fontSize: 20.0,
                      fontFamily: 'Khand',
                      fontWeight: FontWeight.w500,
                    ),)
              ),
              Align(
                  child:SizedBox(
                    width:250,
                    height: 40,
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        color: Color(0xFF40826D),
                        fontSize: 18,
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: (val){
                        setState(()=>conpass=val);
                      },
                      validator: (val)=>(val!.isEmpty)?'Enter correct passcode':null,
                      controller: conpassText,
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
                        hintText: '  confirm password',
                      ),
                    ),
                  )
              ),
            ],),
          Spacer(flex: 2),
          Row(
            children: [
              Container(
                width:MediaQuery.of(context).size.width/9.5,
              ),
              Align(
                child: TextButton(
                    onPressed: () async{
                       setState(()=>loading=true);
                       dynamic result=await _auth.signwithEmail(email,password,conpass);

                           print("Hello");
                           print(result);

                        if(result==null)
                          {
                            print('Error');
                            setState(()=>loading=false);

                          }
                        else{
                          print("Signed In");
                          print(result.uid);
                          String user=result.uid;
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>Info()));
                    }

                    print(email);
                          print(password);
                          print(conpass);
                          setState((){
                            emailText.clear();
                            passwordText.clear();
                            conpassText.clear();
                          });
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

              Container(
                  width: 10
              ),

              Align(
                child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return Toggle();}));
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
          Spacer(flex: 1,),
          Spacer(flex: 5),
        ]
      ),
    );
  }
}