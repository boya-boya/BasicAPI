// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:layout/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App แนะนำช่อง Youtube ที่น่าสนใจ',
      home: HomePage(),
    );
  }
}
