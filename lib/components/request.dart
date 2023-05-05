import 'package:flutter/material.dart';

class Talep extends StatelessWidget {
  const Talep({super.key});

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Talep"),
              Icon(
                Icons.arrow_forward_rounded,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
