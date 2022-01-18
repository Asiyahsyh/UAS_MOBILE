import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_berita/main.dart';

//Membuat Halaman Crad
class halaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Heading"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.computer_rounded, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, 'technology');
                },
                iconSize: 70.0,
              ),
              Text("Technology")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon:
                    new Icon(Icons.sports_soccer_rounded, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, 'sport');
                },
                iconSize: 70.0,
              ),
              Text("Sport")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.account_box_outlined, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, 'profile');
                },
                iconSize: 70.0,
              ),
              Text("Profile")
            ],
          )
        ],
      )),
    );
  }
}
