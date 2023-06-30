import 'package:blood_donation/reusable/reusable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
enum gendergroup{male,female,other}
class example extends StatefulWidget {
  const example({Key? key}) : super(key: key);

  @override
  State<example> createState() => _exampleState();
}

class _exampleState extends State<example> {
  @override
  gendergroup _gen =gendergroup.female;
  final _list =[
    "o+ve","a+ve","o-ve",
  ];
  String? _blood;
  String? _valu;
  final TextEditingController _controller=TextEditingController();
  final TextEditingController _con=TextEditingController();
   final TextEditingController _noblood=TextEditingController();
  void _addtask()
  {
FirebaseFirestore.instance.collection("exam").add({
"email":_controller.text,
 "name":_con.text,
  "blood":_blood,
  "abc":_noblood.text,
//"gender":_gen,
});
  }
  Widget build(BuildContext context) {
    return Scaffold(


        backgroundColor: Colors.green[300],
        body: SafeArea(
          child:SingleChildScrollView(


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_android,
                  size: 100,

                ),
                //hello again
                Text('Hello again',
                    style:TextStyle(fontWeight:FontWeight.bold,
                      fontSize:34,
                    )

                ),
                SizedBox(height: 10),
                Text('welcome back you',
                    style:TextStyle(
                      fontSize: 24,
                    )

                ),
                SizedBox(height: 50),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child:   Container(
                    decoration: BoxDecoration(
                      color:Colors.grey[200],
                      border: Border.all(color:Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:   Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border:InputBorder.none,

                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 10),
                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child:   Container(
                    decoration: BoxDecoration(
                      color:Colors.grey[200],
                      border: Border.all(color:Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:   Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _con,
                        obscureText: true,
                        decoration: InputDecoration(
                          border:InputBorder.none,

                        ),

                      ),
                    ),
                  ),
                ),

               // RadioListTile(
               //     value: gendergroup.male,
               //     title: const Text("male"),
               //     groupValue: _gen,
               //     onChanged: (gendergroup?val){
               //       setState(() {
               //         _gen=val!;
               //       });
               //
               //
               //     }
               // ),
               //  RadioListTile(
               //      value: gendergroup.female,
               //      title: const Text("female"),
               //      groupValue: _gen,
               //      onChanged: (gendergroup?val){
               //        setState(() {
               //          _gen=val!;
               //        });
               //
               //
               //      }
               //  ),
               //  RadioListTile(
               //      value: gendergroup.other,
               //      title: const Text("other"),
               //      groupValue: _gen,
               //      onChanged: (gendergroup?val){
               //        setState(() {
               //          _gen=val!;
               //        });
               //
               //
               //      }
               //  ),
                SizedBox(height: 10),
                reusableTextField(
                    "How many times blood donated", Icons.person_outline,
                    false,
                    _noblood),

                //sign button

                SizedBox(height: 10),

                 TextButton(onPressed: (){
                //   print(_con.text);
                //   print(_controller.text);
                //   print(_blood);
                //   print(_noblood.text);
                //   print(_gen);

                   _addtask();
                },
                    child: Text("add ")
                )


              ],),
          ),
        )
    );
  }
}
