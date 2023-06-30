import 'dart:ffi';

import 'package:blood_donation/msg%20and%20call.dart';
import 'package:blood_donation/view_donor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);
  @override
  State<search> createState() => _searchState();
}
class _searchState extends State<search> {
  var _addresss = "";
  var _latitude = "";
  var _longtitude = "";
  late String phone;
  late String la;

  Future<void> _updateposition() async {
    Position pos = await _determinePosition();
    // distance= await Geolocator.distanceBetween(pos.latitude, pos.longitude, storelat, storelag);

    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _latitude = pos.latitude.toString();
      _longtitude = pos.longitude.toString();
      // _altitude=pos.altitude.toString();
      // _speed=pos.speed.toString();
      _addresss = pm[0].toString();
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

  List searchresult = [];

  void searchfromfirebase(String query) async {
    final result = await FirebaseFirestore.instance.collection("donor")
        .where('blood', isEqualTo: query).get();

    setState(() {
      searchresult = result.docs.map((e) => e.data()).toList();
      // resa=searchresult[0];
      // print(resa);
      print(searchresult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color.fromRGBO(128, 0, 0, 5),
        title: const Text("DONOR SEARCH",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),

      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(15.0),
            child: TextFormField(

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "search O+ve, O-ve, A+ve, A-ve,B+ve,B-ve,AB+ve,AB-ve ",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "seach";
                } else {
                  return null;
                }
              },
              onChanged: (query) {
                searchfromfirebase(query);
              },

            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(_addresss),
          ElevatedButton(onPressed: _updateposition,
            child: Text("Location"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(128, 0, 0, 5),)),),
          Expanded(
              child: ListView.builder(
                  itemCount: searchresult.length,

                  itemBuilder: (context, index) {
                    // return GestureDetector(
                    //   onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(
                    //         builder: (context)=>view(),
                    //         settings: RouteSettings(
                    //           arguments: searchresult[index],
                    //         )
                    //     )
                    //     );
                    //     print("this is ok");
                    //   },
                    return ListTile(

                      onTap: () async {
                        //   // if(!await launch('tel:'
                        //   // )) throw"dould not launch";
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => view(),
                                settings: RouteSettings(
                                  arguments: searchresult[index]["phone"],
                                )
                            )

                        );
                      },

                      contentPadding: EdgeInsets.all(8.0),
                      //phone=searchresult[index]["phone"],
                      leading: CircleAvatar(
                        radius: 20, backgroundColor: Colors.grey,),
                      title: Text(searchresult[index]["name"]),
                      subtitle: Text(searchresult[index]["blood"]),
                      trailing: Text(searchresult[index]["age"]),
                      //trailing: Text(searchresult[index]["phone"]),

                     // la=searchresult![index]["longtitude"]
                    );
                    // child: Card(
                    //    margin: EdgeInsets.all(8),
                    //    child: Padding(
                    //      padding: const EdgeInsets.all(10.0),
                    //      child: Text(searchresult[index]["name"],style: TextStyle(fontSize: 18.0,height: 2,
                    //          color: Colors.black,
                    //          fontWeight: FontWeight.bold),),
                    //    ),
                    //  )
                    //  );

                  }
              )
          ),

        ],
      ),
    );
  }
}