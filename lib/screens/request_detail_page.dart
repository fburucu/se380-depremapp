// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


import '../components/static/header_component.dart';

class RequestDetail extends StatefulWidget {
  final Map request;

  const RequestDetail({super.key, required this.request});

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
  // void initState() {

  //   super.initState();
  // }

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
                        widget.request['name'],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#222B45")),
                      ),
                      Text(
                        widget.request['phone'],
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
                        widget.request['address'],
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
                          child: Text(widget.request['needs'],
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
