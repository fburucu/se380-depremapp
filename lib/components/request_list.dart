import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:depremapp/components/static/header_component.dart';
import 'package:google_fonts/google_fonts.dart';

class TalepList extends StatelessWidget{
  const TalepList({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: HexColor("F2F1F6"),
      appBar: Header(),
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
                    'Talepler',
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: HexColor('222B45'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}