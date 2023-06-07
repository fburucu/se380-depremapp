import 'package:depremapp/model/earthquake.dart';
import 'package:depremapp/screens/request_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../components/static/header_component.dart';

class EarthQuakeDetail extends StatelessWidget {
  final EarthQuake earthQuake;
  const EarthQuakeDetail(this.earthQuake, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2F1F6"),
        appBar: Header(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.all(16),
            child: Wrap(runSpacing: 8, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        earthQuake.Region,
                        style: TextStyle(
                            fontSize: earthQuake.City == "" ? 24 : 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#222B45")),
                      ),
                      if (earthQuake.City != "")
                        Text(
                          earthQuake.City,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: HexColor("#222B45")),
                        ),
                    ],
                  ),
                  Text(
                    '${earthQuake.Magnitude}"',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: HexColor("#222B45")),
                  )
                ],
              ),
              const Divider(),
              Text('${earthQuake.Time} ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#222B45"))),
              // Text('Son Güncelleme: ${earthQuake.LastUpdate} ',
              //     style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //         color: HexColor("#222B45"))),
              // Image.network(earthQuake.MapImage),
              SizedBox(
                height: 200,
                child: FlutterMap(
                  options: MapOptions(
                      center: LatLng(earthQuake.Latitude, earthQuake.Longitude),
                      zoom: 7.5),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point:
                              LatLng(earthQuake.Latitude, earthQuake.Longitude),
                          builder: (BuildContext context) {
                            return const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: HexColor("222B45"),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TalepList(
                                    earthQuakeId: earthQuake.ID,
                                  )));
                    },
                    child: const Text(
                      'Bu Depreme Ait Talepleri Görüntüle',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          ),
        ));
  }
}
