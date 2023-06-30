import 'package:blood_donation/home.dart';
import 'package:blood_donation/reusable/reusable.dart';
import 'package:blood_donation/signin.dart';
import 'package:blood_donation/user_home.dart';
import 'package:blood_donation/usignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dlogin extends StatefulWidget {
  const dlogin({Key? key}) : super(key: key);

  @override
  State<dlogin> createState() => _notState();
}

class _notState extends State<dlogin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(128, 0, 0, 5),
          elevation: 0,
          title: const Text(
            "User LogIn ",
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
                        signInSignUpButton(context,true,(){

                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                              .then((value) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomeScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });}),
                        signUpOption()
                      ]

                  ),

                )
            )
        )
    );
  }
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
