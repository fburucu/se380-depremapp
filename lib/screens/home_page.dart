// ignore_for_file: prefer_const_constructors

import 'package:depremapp/components/static/header_component.dart';
import 'package:depremapp/screens/donor_page.dart';
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
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VictimPage()),
                    );
                  },
                  child: Text(
                    "Depremzede",
                    style: TextStyle(
                      color: Colors.black,
                    ),
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
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DonorPage()),
                    );
                  },
                  child: Text(
                    "Bağışçı",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Hızlı işlemler',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 200, maxWidth: 350),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              'İhtiyaçlarını Gönder',
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 30,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              'İhtiyaç Listesini Göster',
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('Payment link'),
                            Icon(
                              Icons.arrow_forward_rounded,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
