// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool isLoaded = false;
  List<Map> taleps = [];

  String phone = "";

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState

    chechPhoneEntered();
    super.initState();
  }

  Future<void> getTaleps() async {
    setState(() {
      isLoaded = false;
    });
    final query = FirebaseFirestore.instance.collection('victims');

    final qSnap = await query.where('phone', isEqualTo: phone).get();

    setState(() {
      taleps = qSnap.docs.map((e) => e.data()).toList();
      isLoaded = true;
    });
    print(taleps);
  }

  Future<void> chechPhoneEntered() async {
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

      await getTaleps();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return Scaffold(
        backgroundColor: HexColor("F2F1F6"),
        appBar: Header(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: HexColor("F2F1F6"),
      appBar: Header(),
      body: RefreshIndicator(
        onRefresh: () async {
          await getTaleps();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
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
                            MaterialPageRoute(
                                builder: (context) => NewRequest()),
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
                      children: taleps.map((e) => Talep(e)).toList(),
                    ),
                  ),
                  if (taleps.isEmpty)
                    const Text(
                      "Talep bulunmamaktadır.",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )
                ],
              )),
        ),
      ),
    );
  }
}
