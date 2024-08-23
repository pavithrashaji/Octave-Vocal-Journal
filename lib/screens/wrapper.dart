import 'package:octave/screens/authenticate/authenticate.dart';
import 'package:octave/screens/authenticate/login.dart';
import 'package:octave/screens/authenticate/signup.dart';
import 'package:octave/screens/authenticate/togglePage.dart';
import 'package:octave/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:octave/models/user.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /*print("HELLO");
    final user=Provider.of<MyUser?>(context);
    print(user);
    if(user==null){
      return Authenticate();

    }
    else{
      return Home();
    }*/
    return Toggle();

  }
}
