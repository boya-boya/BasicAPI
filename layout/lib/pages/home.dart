// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Computer Knowledge"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            //var data = json.decode(snapshot.data.toString());
            var data = snapshot.data;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'],
                    data[index]['image_url'], data[index]['detail']);
              },
              itemCount: data.length,
            );
          },
          //future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          future: getData(),
        ),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String imgURL, String detail) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      //color: Colors.blue[50],
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imgURL),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.45), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(title, subtitle, imgURL, detail)));
            },
            child: Text(
              "อ่านต่อ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future getData() async {
    // https://raw.githubusercontent.com/boya-boya/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/boya-boya/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
