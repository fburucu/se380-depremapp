// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../components/static/header_component.dart';

class RequestDetail extends StatefulWidget {
  const RequestDetail({super.key});

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2F1F6"),
        appBar: Header(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Serhat Gündoğdu",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#222B45")),
                      ),
                      Text(
                        "+90 534 999 98 74",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#222B45")),
                      )
                    ]),
              ),
              SizedBox(
                height: 200,
                child: FlutterMap(
                  options: MapOptions(center: LatLng(51.5, -0.09), zoom: 13.0),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AAA Mah. Bilmem Ne Sokak. No 19",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black54),
                      ),
                      Divider(),
                      Text(
                        "İhtiyaçlar",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#222B45")),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: HexColor("#d3d3db"),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                              "Battaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numara Battaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numaraBattaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numaraBattaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numaraBattaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numaraBattaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numaraBattaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numaraBattaniye, Çadır, Su, Erkek Kıyafet, Kadın Kıyafet, Ayakkabı 36 numara",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor("#222B45"))),
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
