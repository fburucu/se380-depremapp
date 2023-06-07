import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depremapp/components/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:depremapp/components/static/header_component.dart';
import 'package:google_fonts/google_fonts.dart';

class TalepList extends StatefulWidget {
  final String earthQuakeId;

  const TalepList({super.key, this.earthQuakeId = ""});

  @override
  State<TalepList> createState() => _TalepListState();
}

class _TalepListState extends State<TalepList> {
  bool isLoaded = false;
  List<Map> taleps = [];

  @override
  void initState() {
    getTaleps();
    super.initState();
  }

  Future<void> getTaleps() async {
    setState(() {
      isLoaded = false;
    });
    final query = FirebaseFirestore.instance.collection('victims');

    if (widget.earthQuakeId == "") {
      final qSnap = await query.get();

      setState(() {
        taleps = qSnap.docs.map((e) => e.data()).toList();
        isLoaded = true;
      });

      return;
    }
    final qSnap =
        await query.where('earthquake', isEqualTo: widget.earthQuakeId).get();
    setState(() {
      taleps = qSnap.docs.map((e) => e.data()).toList();
      isLoaded = true;
    });
    print(taleps);
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
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'İhtiyaç Talepleri',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: HexColor('222B45'),
                      ),
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
            ),
          ),
        ),
      ),
    );
  }
}
