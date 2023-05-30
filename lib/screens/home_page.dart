// ignore_for_file: prefer_const_constructors

import 'package:depremapp/components/static/header_component.dart';
import 'package:depremapp/screens/donor_page.dart';
import 'package:depremapp/screens/new_request_page.dart';
import 'package:depremapp/screens/victim_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                'Giriş Yap',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: HexColor('222B45'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VictimPage()),
                    );
                  },
                  child: Text(
                    "Depremzede",
                    style: TextStyle(
                        color: HexColor("2E3A59"),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DonorPage()),
                    );
                  },
                  child: Text(
                    "Bağışçı",
                    style: TextStyle(
                        color: HexColor("2E3A59"),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hızlı işlemler',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: HexColor("2E3A59")),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewRequest()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'İhtiyaçlarını Gönder',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: HexColor("2E3A59")),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                            color: HexColor("2E3A59"),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => VictimPage()),
                        // );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'İhtiyaç Listesini Göster',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: HexColor("2E3A59")),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                            color: HexColor("2E3A59"),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => VictimPage()),
                        // );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Son Depremleri Göster',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: HexColor("2E3A59")),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                            color: HexColor("2E3A59"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ))),
    );
  }
}
