import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hospital_search extends StatefulWidget {
  const hospital_search({Key? key}) : super(key: key);

  @override
  State<hospital_search> createState() => _hospital_searchState();
}

class _hospital_searchState extends State<hospital_search> {
  Map<String,dynamic>? userMap;
  bool isLoading=false;
  final TextEditingController _search=TextEditingController();
  void onsearch() async{
    FirebaseFirestore _fire=FirebaseFirestore.instance;
    setState(() {
      isLoading=true;
    });
    await _fire.collection('donor').where("bloodgroup",isEqualTo: _search.text)
        .get().then((value) {

      setState(() {
        userMap=value.docs[0].data();
        isLoading=false  ;
      });
      print(userMap);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Color.fromRGBO(128, 0, 0, 5),
        title: Text("SEARCH HOSPITAL"),
      ),
      body:isLoading? Center(child: Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),),
      ): Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _search,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white.withOpacity(0.9)),
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.black.withOpacity(0.3),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: onsearch,
              child: Text("SEARCH"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>( Color.fromRGBO(128, 0, 0, 5),) ),
          ),
          SizedBox(
            height: 20,
          ),
          userMap !=null ?
          ListTile(
            onTap: (){},
            leading: Icon(Icons.person),
            title: Text(userMap?['name'],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
            subtitle: Text(userMap?['bloodgroup']),
            trailing: Icon(Icons.chat,color: Colors.red,),
          )
              :Container(),
        ],
      ),
    );
  }
}
