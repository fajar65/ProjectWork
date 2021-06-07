import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/detail_screen.dart';
import 'package:flutter_login_ui/utilities/data_desain.dart' show DesainModel;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class Desain extends StatefulWidget {
  @override
  _DesainState createState() => _DesainState();
}

class _DesainState extends State<Desain> {

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
        
          margin: EdgeInsets.all(15.0),
          child: new StaggeredGridView.countBuilder(
            
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            crossAxisCount: 4,
            itemCount: list.length,
            itemBuilder: (context, i){
              final x = list[i];
            
            return GestureDetector(
              onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>DetailScreen(x)
                      ));
                  },
              child: Stack(
                children: [
                  ClipRRect(
                    child: Image.network('http://192.168.43.57/rod_ci/assets/admin/uploads/' + x.gambar),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                Positioned(
                    bottom: 15,
                    left: 15,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            x.judul,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          
                        ]))
              ]),
            );
            },
            staggeredTileBuilder: (i) => new StaggeredTile.fit(2),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          )),
    ),
  );
  }
}