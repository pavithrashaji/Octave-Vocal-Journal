import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:octave/models/user.dart';
import 'package:octave/screens/authenticate/info.dart';
import 'package:octave/screens/authenticate/togglePage.dart';
import 'package:octave/screens/home/audio.dart';
import 'package:octave/screens/home/calendar.dart';
import 'package:octave/screens/home/entrylist.dart';
import 'package:octave/screens/home/home.dart';
import 'package:octave/screens/wrapper.dart';
import 'package:octave/services/auth.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData:null,
      value:AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
