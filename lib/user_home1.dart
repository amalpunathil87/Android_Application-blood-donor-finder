import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user_home1 extends StatefulWidget {
  const user_home1({Key? key}) : super(key: key);

  @override
  State<user_home1> createState() => _user_home1State();
}

class _user_home1State extends State<user_home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 5),
        title: Text("USER HOME"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/life.jpg'),
                  fit:BoxFit.cover,
                  alignment: Alignment.center
              )
          ),


      )
    );



  }
}