import 'package:blood_donation/reusable/reusable.dart';
import 'package:blood_donation/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({Key? key}) : super(key: key);




  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _latitude="";
  var _longtitude="";
// var _altitude="";
// var _speed="";
  var _addresss="";
  //String ?_addresss;
  // double storelat=12.0205765;
  // double storelag=79.8553258;
  Future<void>_updateposition() async{
    Position pos= await _determinePosition();
    // distance= await Geolocator.distanceBetween(pos.latitude, pos.longitude, storelat, storelag);

    List pm =await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {

      _latitude=pos.latitude.toString();
      _longtitude=pos.longitude.toString();
      // _altitude=pos.altitude.toString();
      // _speed=pos.speed.toString();
      _addresss=pm[0].toString();

    });
    // print("distance $distance");
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition();

  }




  // _SignUpScreenState()
  // {
  //   _sel = _list[0];
  // }
   //FirebaseFirestore _firestore=FirebaseFirestore.instance;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  String ?_blood;
  String ?_gen;
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _add = TextEditingController();
  TextEditingController _noblood = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _location = TextEditingController();
  int _value = 1;

  //String? _sel="";
  final _list = ["O+ve", "O-ve", "A+ve", "A-ve","B+ve","B-ve","AB+ve","AB-ve "];
  final _list1 = ["male","female","other"];

  void _addtask()
  {
    FirebaseFirestore.instance.collection("donor").add({
      "email":_emailTextController.text,
      "password":_passwordTextController.text,
      "name":_name.text,
      "blood":_blood,
      "gender":_gen,
      "phone":_number.text,
      "age":_age.text,
      "address":_add.text,
      "no.donation":_noblood.text,
      "donation_date":_date.text,
      "location":_addresss,
      "longtitude":_longtitude,
      "latitude":_latitude,
//"gender":_gen,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 5),
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
                      'assets/depositphotos_41273545-stock-photo-hands-holding-red-heart-with.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter
              )
          ),
          child: SingleChildScrollView(
             child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButtonFormField(
                          hint: Text("select blood group"),
                          value: _blood,

                          onChanged: (value){
                            //print(value);
                            setState(() {
                              _blood=value;
                            });

                          },
                          items:_list.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }



                          ).toList()
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter name", Icons.person_outline, false,
                        _name),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButtonFormField(
                          hint: Text("select gender"),
                          value: _gen,

                          onChanged: (value){
                            //print(value);
                            setState(() {
                              _gen=value;
                            });

                          },
                          items:_list1.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }



                          ).toList()
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter phone no.", Icons.person_outline, false,
                        _number),
                    const SizedBox(
                      height: 20,
                    ), reusableTextField("Enter Age", Icons.person_outline, false,
                        _age),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Address", Icons.person_outline, false,
                        _add),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "How many times blood donated", Icons.person_outline,
                        false,
                        _noblood),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(_addresss),
                    ElevatedButton(onPressed: _updateposition, child: Text("location")),

                    // Padding(padding: const EdgeInsets.all(10.0),
                    //   child: TextField(controller: _addresss,
                    //     decoration: const InputDecoration(
                    //         icon: Icon(Icons.location_on),
                    //         labelText: "select Location"),
                    //   ),
                    // ),
                     Padding(padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _date,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today_rounded),
                            labelText: "select last donated date"

                        ),

                        onTap:() async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2040));
                          if (pickeddate != null) {
                            setState(() {
                              _date.text =
                                  DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up",  () {


                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text

                      )



                          .then((value) async {
                        _addtask();
                           // Future addUserDetails()
                           // User? user= FirebaseAuth.instance.currentUser;
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                            // await FirebaseFirestore.instance.collection("users").add(
                            //
                            // {
                            //   "address":_add,
                            //  //  "age": _age ,
                            //   //"bloodgroup":  _sel  ,
                            //   //"gender":  _value ,
                            //   //"last_donation": _date ,
                            //   "location":  _location ,
                            //   "name" :  _name ,
                            //  // "no_of_donation": _noblood,
                            //  // "phone" :  _number  ,
                            // });


                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    })
                   /* TextButton(
                      onPressed: (){

                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                               email: _emailTextController.text,
                            password: _passwordTextController.text

                            );






                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },

                      child:   Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color:Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: Center(child: Text('USER', style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 30,fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),*/

                  ],
                ),
              )
          )
      ),
    );
  }
}
