import 'package:depremapp/screens/victim_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:depremapp/components/static/header_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewRequest extends StatefulWidget {
  const NewRequest({super.key});

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  final victimNameController = TextEditingController();
  final victimPhoneController = TextEditingController();
  final victimAddressController = TextEditingController();
  final victimNeedsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F2F1F6"),
      appBar: Header(),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Ad Soyad",
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
                      controller: victimNameController,
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
                  SizedBox(
                    height: 70,
                  ),
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
                      controller: victimPhoneController,
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
                  SizedBox(
                    height: 70,
                  ),
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
                    child: TextFormField(
                      controller: victimAddressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adresiniz',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'İhtiyaçlarınız',
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
                    child: TextFormField(
                      controller: victimNeedsController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'İhtiyaçlarınız..',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VictimPage()),
                        );
                      },
                      child: Text("İptal"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black38,
                      ),
                      onPressed: () async {
                        Map<String, dynamic> victims = {
                          'name': victimNameController.text,
                          'phone': victimPhoneController.text,
                          'address': victimAddressController.text,
                          'needs': victimNeedsController.text,
                        };
                        CollectionReference victimsCollection =
                            FirebaseFirestore.instance.collection('victims');
                        var added = await victimsCollection.add(victims);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VictimPage()),
                        );
                      },
                      child: Text("Kayıt Et"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
