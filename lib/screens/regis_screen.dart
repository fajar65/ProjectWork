import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/utilities/FadeAnimation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class RegisScreen extends StatefulWidget {
  @override
  _RegisScreenState createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController pass= TextEditingController();
  // TextEditingController level = TextEditingController();
  String msg = '';

  Future _register()async{
    var url = "http://192.168.43.57/rod/regis.php";
    var response = await http.post(url, body:{
      "email" : email.text,
      "username" : user.text,
      "password" : pass.text,  
      // "level" : level.text,  
    });
  }

  //   var data = json.decode(response.body);
  //   if (data == "Error"){
  //     Fluttertoast.showToast(
  //       msg: "Registrasi gagal",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 20.0,
  //     );
  //   }else{
  //     Fluttertoast.showToast(
  //       msg: "Registrasi berhasil",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white,
  //       fontSize: 20.0,
  //     );
  //   }
  // }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 310,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/background.png'),
	                  fit: BoxFit.fill,
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 100,
	                    child: FadeAnimation(1.3, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 120,
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/clock.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    child: FadeAnimation(1.7, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Daftar", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.only(top: 5, left: 30, right: 30,),
	              child: Column(
	                children: <Widget>[
	                  FadeAnimation(2, Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              controller: email,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email",
	                              hintStyle: TextStyle(color: Colors.grey)
	                            ),
	                          ),
	                        ),
                          Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              controller: user,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Username",
	                              hintStyle: TextStyle(color: Colors.grey)
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextField(
                              obscureText: true,
                              controller: pass,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.grey)
	                            ),
	                          ),
	                        ),
                          
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
	                  FadeAnimation(2.5, Container(
	                    height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .8),
                          ],
                        ),
	                    ),
	                    child: Center(
                        child:  FlatButton(
                        
                        onPressed: () {
                          _register();
                        },
	                      child: Text("Daftar", style:
                         TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                          ),
	                    ),
                      ),
	                  )),
	                  SizedBox(height: 18,),
                     Container(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return LoginScreen();
                          }));
                        },
                        child: FadeAnimation(3, Text("Sudah punya akun ? Login",
                          style: TextStyle(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            fontSize: 15.0,
                            )
                          ),
                        ),
                      ),
                     ),
	                ],
                  ),
	              ),
	            
	          ],
	        ),
	      ),
      )
    );
  }
}