import 'package:flutter/material.dart';
import 'package:octave/screens/authenticate/login.dart';
import 'package:octave/screens/authenticate/signup.dart';

class Authenticate extends StatefulWidget {

  @override
  State<Authenticate> createState() => _AuthenticateState();

}

class _AuthenticateState extends State<Authenticate> {
  bool show=true;
  void t(bool type)
  {
    if(type==true)
      {
        show=true;
      }
    else{
      show=false;
    }

  }
  @override
  Widget build(BuildContext context) {
    if(show)
      {
        return Login();
      }
    else
      {
        return SignUp();
      }
  }
}

class Find{
  void togglep(String type)
  {
    _AuthenticateState page=new _AuthenticateState();

    if(type=='login')
      {
        page.t(true);

      }
    else{
      page.t(false);
    }

  }
}
