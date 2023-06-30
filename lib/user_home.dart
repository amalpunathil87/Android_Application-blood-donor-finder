import 'package:blood_donation/donor_search.dart';
import 'package:blood_donation/hospital_search.dart';
import 'package:blood_donation/login.dart';
import 'package:blood_donation/search_dononr.dart';
import 'package:blood_donation/user_home1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user_home extends StatefulWidget{
  const user_home({Key? key}) : super(key: key);

  @override
  State<user_home> createState() => _user_homeState();
}

class _user_homeState extends State<user_home> {
  int _currentindex=0;
 final _pages=[
    user_home1(),
    search(),
    hospital_search()


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(

          backgroundColor: Color.fromRGBO(128, 0, 0, 5) ,

        selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blue,
          selectedFontSize: 12,
          currentIndex: _currentindex,
          onTap:(newindex){
            setState(() {
              _currentindex=newindex;
            });
          } ,
          items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'HOME'),
        BottomNavigationBarItem(icon: Icon(Icons.person_search),label: 'SEARCH DONOR'),
        BottomNavigationBarItem(icon: Icon(Icons.local_hospital),label: 'SEARCH HOSPITAL'),
      ]),


    );
  }
}
