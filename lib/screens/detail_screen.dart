import 'package:flutter/material.dart';
import 'package:flutter_login_ui/utilities/data_desain.dart';

class DetailScreen extends StatefulWidget {
  final DesainModel model;
  DetailScreen(this.model);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                title: Text('Detail'),
                expandedHeight: 310.0,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.model.id,
                    child: Image.network(
                      'http://192.168.43.57/rod_ci/assets/admin/uploads/' + widget.model.gambar,
                      fit: BoxFit.cover
                      ),
                    )
                ),
              )
            ];
          },
          body: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30.0,
                  right: 30.0,
                  left: 30.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Text(widget.model.judul,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          
                        ),
                        ),
                      ),
                      Text(widget.model.deskripsi,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        
                        ),
                      ),
                    ]
                  )),
                // Positioned(
                //   bottom: 7.0,
                //   // top: 0.0,
                //   left: 0.0,
                //   right: 0.0,
                //   child: Container(
                //     padding: EdgeInsets.all(15.0),
                //     child: Material(
                //       // color: Color(0xFF112494),
                //       color: Colors.orange,
                //       borderRadius: BorderRadius.circular(10.0),
                //       child: MaterialButton(
                //         onPressed: (){
                //           print('Koleksi');
                //         },
                //         child: Text('Tambahkan Koleksi',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 17.0
                //           ),
                //         ),
                //       ),
                //     ),
                //   )
                //   )
              ],)
          ),
        
        ),
    );
  }
}
