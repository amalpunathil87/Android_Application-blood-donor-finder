import 'package:blood_donation/example.dart';
import 'package:blood_donation/new.dart';
import 'package:blood_donation/parameter.dart';
import 'package:blood_donation/phonelog.dart';
import 'package:blood_donation/search_dononr.dart';
import 'package:blood_donation/signin.dart';
import 'package:blood_donation/splash.dart';
import 'package:blood_donation/user_home1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'donor_search.dart';
import 'homelog.dart';
import 'location.dart';
import 'login.dart';
import 'not.dart';
import 'user_home.dart';

Future  main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:splash ()
      //AnimatedSplashScreen(splash: Icons.blood, nextScreen: homelog())
    );
  }
}
