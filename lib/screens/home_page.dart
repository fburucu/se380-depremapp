// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/request.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Container(
          margin: EdgeInsets.only(top: 25),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Taleplerin",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: HexColor('222B45'),
                    ),
                  ),
                  Text("Tümünü Gör",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: HexColor('222B45'),
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Wrap(
                  runSpacing: 12,
                  children: const [
                    Talep(),
                    Talep(),
                    Talep(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
