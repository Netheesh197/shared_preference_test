import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference_test/view/home_screen/home_screen.dart';
import 'package:shared_preference_test/view/login_screen/login_screen.dart';
import 'package:shared_preference_test/view/register_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isLogged;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), ()  async{
  

      final SharedPreferences prefs = await SharedPreferences.getInstance();

     final isLogged = prefs.getBool('isLogged') ?? false;
        
        if(isLogged == true){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
        }
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text("Splash screen"),
      ),
    );
  }
}