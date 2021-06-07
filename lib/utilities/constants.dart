import 'package:flutter/material.dart';

final List<Map<String, String>> imgSlider = [
  {'gambar':'assets/images/image_01.png', "nama": 'Ini adalah halaman Beranda'},
  {'gambar':'assets/images/image_02.jpg', "nama": 'Ini '},
  {'gambar':'assets/images/image_03.jpg', "nama": 'Ini '},
  {'gambar':'assets/images/image_04.jpg', "nama": 'Ini '},
];

final List<Map<String, String>> popular = [
    
    {'gambar': 'assets/images/gambar (1).jpeg', "judul": 'Logo'},
    {'gambar': 'assets/images/gambar (2).jpeg', "judul": 'Logo'},
    {'gambar': 'assets/images/gambar (3).jpeg', "judul": 'Logo'},
    {'gambar': 'assets/images/gambar (4).jpeg', "judul": 'Logo'},
    {'gambar': 'assets/images/gambar (5).jpeg', "judul": 'Logo'},

  ];

final List<Map<String, String>> gambar = [
    // {'img': 'assets/images/a.jpg', "nama": 'Logo'},
    {'img': 'assets/images/b.jpg', "nama": 'Logo'},
    {'img': 'assets/images/gambar (1).jpeg', "nama": 'Logo'},
    {'img': 'assets/images/c.jpg', "nama": 'Logo'},
    // {'img': 'assets/images/d.jpeg', "nama": 'Logo'},
    // {'img': 'assets/images/e.jpeg', "nama": 'Logo'},
    {'img': 'assets/images/gambar (2).jpeg', "nama": 'Logo'},
    {'img': 'assets/images/gambar (3).jpeg', "nama": 'Logo'},
    {'img': 'assets/images/gambar (4).jpeg', "nama": 'Logo'},
    {'img': 'assets/images/gambar (5).jpeg', "nama": 'Logo'},
    {'img': 'assets/images/gambar (6).jpeg', "nama": 'Logo'},
    {'img': 'assets/images/gambar (7).jpeg', "nama": 'Logo'},
    {'img': 'assets/images/13.jpg', "nama": 'Logo'},
  ];

  final List<String> kategori = [
    "Logo",
    "Banner",
    "Illustrasi",
    "Vektor",
    "Flat Desain",
  ];

  final List<String> slide = [
    'image_01.png',
    'image_02.jpg',
    'image_03.jpg',
    'image_04.jpg',
  ];

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final primaryColor = TextStyle(
  color: Color(0xFF112494),
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

