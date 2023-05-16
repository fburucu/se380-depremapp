import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:depremapp/components/static/header_component.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/request.dart';

class NewRequest extends StatefulWidget {
  const NewRequest({super.key});

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2F1F6"),
      appBar: Header(),
      body: Container(
        margin: EdgeInsets.only(top:25),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Yeni Talep",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: HexColor('222B45'),
                    ),
                  ),
                ],
            ),
            Row(
              children: [
                Text("Ad Soyad",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: HexColor('222B45'),
                ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adınız Soyadınız',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Telefon Numarası',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: HexColor('222B45'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefon Numaranız',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                    'Adres',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: HexColor('222B45'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 350,
                  height: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adresiniz',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

  }

}
