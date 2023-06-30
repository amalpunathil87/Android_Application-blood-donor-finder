import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'dlogin.dart';
import 'hlogin.dart';
import 'not.dart';
class homelog extends StatefulWidget {
  const homelog({Key? key}) : super(key: key);

  @override
  State<homelog> createState() => _homelogState();
}

class _homelogState extends State<homelog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/log.jpg'),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => not()));
              },
              child:   Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color:Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(child: Text('USER', style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 30,fontWeight: FontWeight.bold),
                )),
              ),),
            const SizedBox(
              height: 20,
            ),
           TextButton(
             onPressed: (){
               Navigator.push(context,
                   MaterialPageRoute(
                       builder: (context) => dlogin()));
             },
               child:   Container(
               padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color:Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(90),
      ),
      child: Center(child: Text('DONOR', style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 30,fontWeight: FontWeight.bold),
      )),
    ),),

            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => hlogin()));
              },
              child:   Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color:Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(child: Text('HOSPITAL', style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 30,fontWeight: FontWeight.bold),
                )),
              ),),
          ],
        ),
      

      )
    );
  }
}
