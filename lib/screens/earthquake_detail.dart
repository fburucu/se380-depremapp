import 'package:depremapp/model/earthquake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

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
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.all(16),
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
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: HexColor("#222B45")),
                      ),
                      Text('${earthQuake.Time} ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: HexColor("#222B45"))),
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
              Text('Son Güncelleme: ${earthQuake.LastUpdate} ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#222B45"))),
              Image.network(earthQuake.MapImage),
              Center(
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: HexColor("222B45"),
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: Text(
                      'Bu Depreme Ait Talepleri Görüntüle',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          ),
        ));
  }
}
