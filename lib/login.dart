import 'package:blood_donation/reusable/reusable.dart';
import 'package:blood_donation/signin.dart';
import 'package:blood_donation/user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'usignup.dart';
import 'home.dart';


class login extends StatefulWidget{
  @override
  _loginpageState createState() =>_loginpageState();

}
class _loginpageState extends State<login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(128, 0, 0, 5),
        elevation: 0,
        title: const Text(
          "User LogIn",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
        body: SingleChildScrollView(
        child: Container(

          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/depositphotos_41273545-stock-photo-hands-holding-red-heart-with.jpg'),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter
              )
          ),

          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                reusableTextField("Enter email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),

                const SizedBox(
                  height: 5,
                ),
                signInSignUpButton(context,true,(){

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => user_home()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });}),

                signUpOption()

              ],
            ),
          ),
          ),
        ),
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
                MaterialPageRoute(builder: (context) => usignup()));
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