import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  List sresult =[];


  @override
  Widget build(BuildContext context) {
    String? tata=ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 5),
       // title: Text("my data"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/view.jpg'),
                fit: BoxFit.fitHeight,

                alignment: Alignment.topCenter
            )
        ),
        child: Center(
          child: Column(
            children: [
              // Ink.image(
              //   image:AssetImage(
              //       'assets/view.jpg'),
              //
              //   height: 640,
              //   width: 400,
              //   fit: BoxFit.cover,
              //
              // ),
              Text("Contact Donor",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color: Color.fromRGBO(128, 0, 0, 5)),),
            // Padding(padding: EdgeInsets.all(10) ,
            // child:
            // //Text(tata!)
            //   ,
            // ),
             // Text(sresult),
             //  TextButton(
             //    style: TextButton.styleFrom(primary: Colors.teal,foregroundColor: Colors.black),
             //    onPressed: ()async{
             //      if(!await launch('tel:$tata'
             //      )) throw"dould not launch";
             //
             //    }, child: const Text('call'),

              //),
              TextButton(
                onPressed:()async{
                  if(!await launch('tel:$tata'
                  )) throw"dould not launch";

                },
                child:   Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color:Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Center(child: Text('CALL', style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 30,fontWeight: FontWeight.bold),
                  )),
                ),),
              TextButton(
                onPressed:()async{
                  if(!await launch('sms:$tata'
                  )) throw"dould not launch";

                },
                child:   Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color:Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Center(child: Text('MESSAGE', style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 30,fontWeight: FontWeight.bold),
                  )),
                ),),

          //  ElevatedButton(onPressed: searchfromfirebase(String tata), child: Text("Location"),style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>( Color.fromRGBO(128, 0, 0, 5),) ),),
    ],
    ),
        ),
      ),

    );

  }
  // void searchfromfirebase( String tata) async {
  //   final result=await FirebaseFirestore.instance.collection("donor")
  //       .where('email',isEqualTo: tata).get();
  //
  //   setState((){
  //
  //     sresult= result.docs.map((e) =>e.data() ).toList();
  //     // resa=searchresult[0];
  //     // print(resa);
  //     print(sresult);
  //   });
  //
  // }
}
