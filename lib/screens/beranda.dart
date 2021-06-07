import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/detail_screen.dart';
import 'package:flutter_login_ui/utilities/constants.dart';
import 'package:flutter_login_ui/utilities/data_desain.dart' show DesainModel;
import 'package:http/http.dart' as http;

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

  var loading = false;
  final list = new List<DesainModel>();
  final GlobalKey<RefreshIndicatorState> _refresh = 
  GlobalKey<RefreshIndicatorState>();
  Future<void>_lihatData() async {
    list.clear();
    setState(() {
      loading = true;
    });
    var url = "http://192.168.43.57/rod/tampil.php";
    final response = await http.post(url);
    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = new DesainModel(
          api['id'],
          api['id_kategori'],
          api['gambar'],
          api['judul'],
          api['deskripsi'],
        );
        list.add(ab);
      });
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() { 
    super.initState();
    _lihatData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: RefreshIndicator(
      onRefresh: _lihatData,
      key: _refresh,
          child: Container(
        // margin: EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          autoPlayImage,
          
          new Container(
            margin: EdgeInsets.only(
              left: 15.0,
              right: 20.0,
              top: 15.0,
            ),
            child: Text(
              "Terbaru",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.all(15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              
              itemCount: list.length,
              itemBuilder: (context, i){
              final x = list[i];

              return GestureDetector(
                onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>DetailScreen(x)
                      ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 14),
                    child: ClipRRect(
                      
                      child: Image.network(
                        'http://192.168.43.57/rod_ci/assets/admin/uploads/' + x.gambar,
                        width: 105,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    
                  ),
              );
                

              },
                
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15.0,
              right: 20.0,
              top: 15.0,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
              
              padding: EdgeInsets.only(top: 17, right: 25, left: 10),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, i){
              final x = list[i];
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //     print("detail");
                  //   }));
                  // },
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>DetailScreen(x)
                      ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 18, left: 5),
                    height: 115,
                    width: MediaQuery.of(context).size.width - 50,
                    color: Colors.white70,
                    child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            child: Hero(
                              tag: x.id,
                                child: Image.network(
                                'http://192.168.43.57/rod_ci/assets/admin/uploads/' + x.gambar,
                                width: 100,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          
                        ),
                      SizedBox(
                        width: 21,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              x.judul,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            x.judul,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                );
              })
        ]),
      ),
    ),
  );
  }
}

final CarouselSlider autoPlayImage = CarouselSlider(
  items: slide.map((fileImage) {
    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
        left: 9.0,
        right: 9.0,
        bottom: 15.0,
      ),
      child: Stack(
        children:[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'assets/images/${fileImage}',
            width: 10000,
            height: 7000,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 15,
          
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temukan inspirasi desain',
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'di Result of Design',
                  style: TextStyle(
                    color: Colors.white,
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                
              ]))
        ],
      ),
      
    );
    
  }).toList(),
  height: 180,
  autoPlay: true,
  enlargeCenterPage: true,
  autoPlayAnimationDuration: Duration(milliseconds: 1000),
  aspectRatio: 4.0,
);