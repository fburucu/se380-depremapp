import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:audioplayers/audioplayers.dart';

import '../components/static/header_component.dart';

class HornPage extends StatelessWidget {
  const HornPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2F1F6"),
        appBar: Header(),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                final player=AudioCache();
                player.play('horn.mp3');
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Colors.red,
                  shape: CircleBorder()),
              child: const Icon(
                Icons.sports,
                size: 52,
              )),
        ));
  }
}
