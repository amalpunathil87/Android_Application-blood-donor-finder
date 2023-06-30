import 'package:blood_donation/new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class para extends StatefulWidget {
  const para({Key? key}) : super(key: key);

  @override
  State<para> createState() => _paraState();
}

class _paraState extends State<para> {
  final String message="good";
  @override
  Widget build(BuildContext context) {

    gotosec() {
      Navigator.push(context, MaterialPageRoute( builder:
          (context) => newone(msg: message),

      ),
      );
    }
    return Scaffold(

  appBar: AppBar(
    title: Text("first one"),
    centerTitle: true,

  ),
      body: Center(
        child:Column(
            children: [
          GestureDetector(onTap:(){
      setState(() {
      gotosec();
      });
      },

              child: Text("second screen")
    ),
        ],
      ),
      ),



    );
  }
}
