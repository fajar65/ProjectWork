import 'package:flutter/material.dart';
import 'package:flutter_login_ui/main.dart';

class Profile extends StatefulWidget {

  Profile({this.username});
  final String username;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    body: Container(
      height: 500.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Kotak(),
            child: Container(
              color: Color(0xFF112494),
              height: 240.0,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 0.0,
                bottom: 130.0,
                // left: 135.0,
                // right: 135.0,
              ),

              height: 120.0,
              width: 120.0,
              // color: Color(0xFF112494),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/user.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            padding: EdgeInsets.only(
              bottom: 50.0,
              top: 110.0,
            ),
            child: Center(
              child: Text(
                "$username",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}


class Kotak extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 120);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}