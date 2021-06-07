import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/drawer.dart';
import 'package:flutter_login_ui/screens/home_screen.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/screens/splash_screen.dart';

void main() => runApp(MyApp());

String username='';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // ThemeData _lightTheme = ThemeData(
  //   accentColor: Colors.green,
  //   brightness: Brightness.light,
  //   primaryColor: Color(0xFF112494),
  // );

  // ThemeData _darkTheme = ThemeData(
  //   accentColor: Color(0xFF112494),
  //   brightness: Brightness.dark,
  //   primaryColor: Colors.amber,
  // );

  // bool _light = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: _light ? _lightTheme : _darkTheme,
      title: 'Result of Design',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String,WidgetBuilder>{
        '/HomeScreen': (BuildContext context)=> new HomeScreen(username: username,),
        '/MainDrawer': (BuildContext context)=> new MainDrawer(),
        '/LoginScreen': (BuildContext context)=> new LoginScreen(),
      },
    );
  }
}
