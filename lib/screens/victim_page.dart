// ignore_for_file: prefer_const_constructors

import 'package:depremapp/components/static/header_component.dart';
import 'package:depremapp/screens/new_request_page.dart';
import 'package:depremapp/screens/phone_number_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/request.dart';

class VictimPage extends StatefulWidget {
  final String phoneNumberToSaved;
  const VictimPage({super.key, this.phoneNumberToSaved = ""});

  @override
  State<VictimPage> createState() => _VictimPageState();
}

class _VictimPageState extends State<VictimPage> {
  String phone = "";

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState

    chechPhoneEntered();
    super.initState();
  }

  void chechPhoneEntered() async {
    // try {
    SharedPreferences.setMockInitialValues({});

    prefs = await SharedPreferences.getInstance();

    if (widget.phoneNumberToSaved != "") {
      prefs.setString('phone', widget.phoneNumberToSaved);
    }
    String? phoneNumber = prefs.getString('phone');

    print("phone number is ${phoneNumber}");

    if (phoneNumber == null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PhoneNumber(
                    prefs: prefs,
                  )));
    } else {
      setState(() {
        phone = phoneNumber;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    "Taleplerin",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: HexColor('222B45'),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewRequest()),
                      );
                    },
                    child: Text("Yeni Talep Ekle",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: HexColor('222B45'),
                        )),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Wrap(
                  runSpacing: 12,
                  children: const [
                    // Talep(),
                    // Talep(),
                    // Talep(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
