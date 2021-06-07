import 'package:flutter/material.dart';
import 'package:flutter_login_ui/main.dart';

class MainDrawer extends StatefulWidget {
  // MainDrawer({this.username});
  // final String username;

  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

  ThemeData _lightTheme = ThemeData(
    accentColor: Colors.green,
    brightness: Brightness.light,
    primaryColor: Color(0xFF112494),
  );

  ThemeData _darkTheme = ThemeData(
    accentColor: Color(0xFF112494),
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );

  bool _light = true;

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color(0xFF112494),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/user.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    "$username",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _profile();
              }));
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.wb_sunny,
          //     color: Colors.black,
          //   ),
          //   title: Text(
          //     'Mode Gelap',
          //     style: TextStyle(
          //       fontSize: 18,
          //     ),
          //   ),
          //   trailing: Switch(
          //     value: _light, 
          //     onChanged: (state) {
          //       setState((){
          //         _light = state;
          //       });
          //     }
          //   ),
          //   onTap: () => print("Settings"),
          // ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/LoginScreen');
            },
          ),
        ],
      ),
    );
  }
}

Widget _profile() {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xFF112494),
      elevation: 0.0,
    ),
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
          Container(
              padding: EdgeInsets.only(
                bottom: 350.0,
                top: 0.0,
                ),
              child: Center(
                child: Text("Profile",
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              top: 130.0,
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
