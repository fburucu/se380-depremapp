// ignore_for_file: prefer_const_constructors

import 'package:depremapp/components/static/header_component.dart';
import 'package:depremapp/screens/donor_page.dart';
import 'package:depremapp/screens/victim_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2F1F6"),
      appBar: Header(),
      body: Container(
          margin: EdgeInsets.only(top: 25),
          padding: EdgeInsets.all(16),
          child: Center(
              child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VictimPage()),
                  );
                },
                child: Text("Depremzede"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonorPage()),
                  );
                },
                child: Text("Bağışçı"),
              )
            ],
          ))),
    );
  }
}
