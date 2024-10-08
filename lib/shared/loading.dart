import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: Color(0xFFEDDEE3),
      child: Center(
        child:SpinKitWave(
          color: Color(0xFF40826D),
          size:50.0,
        ),
      ),
    );

  }
}