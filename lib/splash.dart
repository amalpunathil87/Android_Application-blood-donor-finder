import 'package:blood_donation/homelog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hlogin.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);


  @override

  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(seconds:5),(){});
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>homelog(),), );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset("assets/558494.jpg",scale: 4,),
            Text("Blood Net",style:TextStyle(fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
          ],
        ),
      ),

    );
  }
}
