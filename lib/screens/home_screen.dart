
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/beranda.dart';
import 'package:flutter_login_ui/screens/desain.dart';
import 'package:flutter_login_ui/screens/drawer.dart';
import 'package:flutter_login_ui/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.username});
  final String username;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _pilihanbottom = 0;

  final List<Widget> _halaman = [
    Beranda(),
    Desain(),
    Profile(),
  ];

  void _onItemTapped (int index){
    setState(() {
      _pilihanbottom = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE0E0E0),
      appBar: AppBar(
        // title: Text("Result of Design"),
        backgroundColor: Color(0xFF112494),
        elevation: 0.0,
        title: Image(
          image: AssetImage("assets/logos/logo.png"),
          height: 48.0,
        ),
        centerTitle: true,
        // actions: <Widget>[
        //   Padding(
        //     padding: EdgeInsets.only(right: 15.0),
        //     child: InkResponse(
        //         onTap: () {},
        //         child: IconButton(
        //             icon: Icon(Icons.search),
        //             onPressed: () {
        //               showSearch(context: context, delegate: DataSearch());
        //             })),
        //   ),
        // ],
      ),
      body: Container(
        child: _halaman.elementAt(_pilihanbottom),
      ),

      drawer: MainDrawer(),

      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        // currentIndex: currentIndex,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        // fabLocation: BubbleBottomBarFabLocation.end,
        // onTap: changePage,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Color(0xFF112494),
            icon: Icon(Icons.home, color: Colors.black),
            activeIcon: Icon(Icons.home, color: Color(0xFF112494)),
            title: Text("Beranda"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Color(0xFF112494),
            icon: Icon(Icons.image, color: Colors.black),
            activeIcon: Icon(Icons.image, color: Color(0xFF112494)),
            title: Text("Desain"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Color(0xFF112494),
            icon: Icon(Icons.account_circle, color: Colors.black),
            activeIcon: Icon(Icons.account_circle, color: Color(0xFF112494)),
            title: Text("Profile"),
          ),
        ],
        currentIndex: _pilihanbottom,
        onTap: _onItemTapped,
      ),

    );
  }
}



class DataSearch extends SearchDelegate<String> {
  final desain = [
    "logo",
    "banner",
    "vektor",
    "illustrasi",
    "ui",
    "desain",
  ];

  final recentDesain = [
    "logo",
    "banner",
    "vektor",
    "illustrasi",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              query,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentDesain
        : desain.where((p) => p.startsWith(query)).toList();

    return suggestionList.isEmpty
        ? Container(
            margin: EdgeInsets.only(
              left: 65.0,
            ),
            child: Image(
              image: AssetImage('assets/images/kosong.png'),
              height: 260.0,
              width: 260.0,
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                showResults(context);
              },
              leading: Icon(Icons.image),
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ),
            itemCount: suggestionList.length,
          );
  }
}
