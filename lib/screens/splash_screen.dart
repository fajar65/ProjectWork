import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/home_screen.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

    void initState(){
      super.initState();
      splashscreenStart();
    }

    splashscreenStart() async{
      var duration = const Duration(seconds: 5);
      return Timer(duration,(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }

    @override
    Widget build(BuildContext context){

      return Scaffold(
        backgroundColor: Color(0xFF112494),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[            
              Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Lottie.asset("assets/logos/01.json",
                          width: 250.0, height: 250.0),
                    ),
                  ),
              
              SizedBox(height: 24.0,),

              Text("Result of Design",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              )
            ],
          ),
        ),
      );
    }


}