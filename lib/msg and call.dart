import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class msg extends StatefulWidget {
  // String res;
//  msg({required this.res});
  const msg({Key? key}) : super(key: key);

  @override
  State<msg> createState() => _msgState();
}

class _msgState extends State<msg> {
  // String res;
  // _msgState(this.res);

  String _str ='+917356016632';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("msg and call"),

      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Text(res,),

            TextButton(
              onPressed: ()async{
              if(!await launch('tel:$_str'
                  )) throw"dould not launch";

            }, child: const Text('call'),
            ),

            TextButton(
              onPressed: ()async{
                if(!await launch('sms:$_str'
                )) throw"dould not launch";

              }, child: const Text('message'),)
          ],
        ),

      ),
    );
  }
}
