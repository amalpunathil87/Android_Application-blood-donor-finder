import 'package:flutter/material.dart';

class newone extends StatefulWidget {
  String msg;
  newone({required this.msg});
  //const newone(List<dynamic> searchresult, {Key? key}) : super(key: key);

  @override
  State<newone> createState() => _newoneState(msg);
}

class _newoneState extends State<newone> {
  String msg;
  _newoneState(this.msg);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text("calling and message"),
  ),
      body: Center(
        child: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ),
    );


  }
}
