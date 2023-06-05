import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/earthquake_list_item.dart';
import '../components/static/header_component.dart';
import '../service/earthquake_service.dart';

class EarthQuakes extends ConsumerWidget {
  const EarthQuakes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncearthquakes = ref.watch(earthquakeProvider);

    final earthquakes = asyncearthquakes.value;

    if (!(asyncearthquakes.hasValue && earthquakes != null)) {
      if (asyncearthquakes.isLoading) {
        return Center(
            child: CircularProgressIndicator(
          color: HexColor('222B45'),
        ));
      } else if (asyncearthquakes.hasError) {
        return const Center(
          child: Text("Bir hata oluştu"),
        );
      } else {
        return const Center(
          child: Text("Bir hata oluştu"),
        );
      }
    }

    return Scaffold(
      backgroundColor: HexColor("F2F1F6"),
      appBar: Header(),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.refresh(earthquakeProvider.future);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 12,
                children: [
                  Text(
                    "Son Depremler",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: HexColor('222B45'),
                    ),
                  ),
                  Wrap(
                    runSpacing: 10,
                    children: earthquakes
                        .map((e) => EarthQuakeItem(earthQuake: e))
                        .toList(),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
