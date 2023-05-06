// ignore_for_file: prefer_const_constructors

import 'package:depremapp/components/earthquake_list_item.dart';
import 'package:depremapp/components/request_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({super.key});

  @override
  State<DonorPage> createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2F1F6"),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Deprem Yardım!",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: HexColor('222B45'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.all(16),
            child: Wrap(
              runSpacing: 12,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Wrap(
                    runSpacing: 12,
                    children: const [RequestContainer()],
                  ),
                ),
                Text(
                  "Son Depremler",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: HexColor('222B45'),
                  ),
                ),
                EarthQuakeItem(
                  city: "İzmir",
                  date: "13:26 Bugün",
                  magnitude: 7.4,
                ),
                EarthQuakeItem(
                  city: "Adana",
                  date: "13:24 Bugün",
                  magnitude: 1.4,
                ),
                EarthQuakeItem(
                  city: "İstanbul",
                  date: "13:26 Bugün",
                  magnitude: 2.1,
                ),
                EarthQuakeItem(
                  city: "Çanakkale",
                  date: "13:26 Bugün",
                  magnitude: 2.6,
                ),
                EarthQuakeItem(
                  city: "İzmir",
                  date: "13:26 Bugün",
                  magnitude: 7.4,
                ),
                EarthQuakeItem(
                  city: "İzmir",
                  date: "13:26 Bugün",
                  magnitude: 7.4,
                ),
                EarthQuakeItem(
                  city: "İzmir",
                  date: "13:26 Bugün",
                  magnitude: 7.4,
                )
              ],
            )),
      ),
    );
  }
}
