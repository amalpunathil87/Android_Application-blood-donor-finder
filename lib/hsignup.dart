import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation/reusable/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blood_donation/home.dart';
class hsignup extends StatefulWidget {
  const hsignup({Key? key}) : super(key: key);

  @override
  State<hsignup> createState() => _hsignupState();
}

class _hsignupState extends State<hsignup> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(128, 0, 0, 5),
          elevation: 0,
          title: const Text(
            "Sign Up ",
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
                        'assets/abc.jpg'),
                    fit:BoxFit.cover,
                    alignment: Alignment.center
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
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField("Enter name", Icons.person_outline, false,
                            _name),
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
                            "Enter valid Phone number", Icons.person_outline, true,
                            _phone),
                        const SizedBox(
                          height: 20,
                        ),
                        firebaseUIButton(context, "Sign Up", () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                              .then((value) {
                            print("Created New Account");
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                        })
                      ]
                  ),

                )
            )
        )


    );
  }
}
