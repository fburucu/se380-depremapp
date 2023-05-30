// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:depremapp/model/earthquake.dart';
import 'package:flutter/material.dart';

class EarthQuakeItem extends StatelessWidget {
  final EarthQuake earthQuake;
  const EarthQuakeItem({super.key, required this.earthQuake});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        height: 85,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                earthQuake.Magnitude.toString(),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
              Wrap(
                spacing: -2,
                direction: Axis.vertical,
                children: [
                  Text(
                    earthQuake.Region,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    earthQuake.Time,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontSize: 13),
                  )
                ],
              )
              // Icon(
              //   Icons.arrow_forward_rounded,
              //   size: 32,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
