import 'package:depremapp/screens/request_detail_page.dart';
import 'package:flutter/material.dart';

class Talep extends StatelessWidget {
  final Map talep;

  const Talep(this.talep, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestDetail(
                      request: talep,
                    )));
      },
      child: SizedBox(
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
              children: [
                Text(
                  talep['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 32,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
