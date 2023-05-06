// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class RequestContainer extends StatelessWidget {
  const RequestContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: HexColor("7F5CF5"),
        ),
        padding: EdgeInsets.only(bottom: 20, top: 20, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bağış Yap",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
                "Depremzedelerin ihtiyaçlarını karşılayabilir ve onlara yardım edebilirsin.",
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text("İhtiyaç Talepleri",
                  style: TextStyle(color: HexColor("2E3A59"))),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
