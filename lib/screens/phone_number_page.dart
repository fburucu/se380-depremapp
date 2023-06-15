import 'package:depremapp/screens/victim_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/static/header_component.dart';

class PhoneNumber extends StatefulWidget {
  final SharedPreferences prefs;

  const PhoneNumber({super.key, required this.prefs});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final phoneNumberController = TextEditingController();

  String formError = "";

  void savePhoneNumber() async {
    setState(() {
      formError = "";
    });

    if (phoneNumberController.text == "") {
      setState(() {
        formError = "Lütfen telefon numaranızı giriniz";
      });
      return;
    }

    // prefs.setString('phone', phoneNumberController.text);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VictimPage(
                  phoneNumberToSaved: phoneNumberController.text,
                )));

    print("Yönleniyor");
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (formError != "")
              Text(
                formError,
                style: TextStyle(color: Colors.red),
              ),
            Text("Telefon Numaranız",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: HexColor("222B45"))),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefon Numaranız',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: TextButton(
                onPressed: savePhoneNumber,
                child: Text(
                  "Kaydet",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: HexColor("222B45"),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
