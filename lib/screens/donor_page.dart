// ignore_for_file: prefer_const_constructors

import 'package:depremapp/components/earthquake_list_item.dart';
import 'package:depremapp/components/request_container.dart';
import 'package:depremapp/components/static/header_component.dart';
import 'package:depremapp/service/earthquake_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DonorPage extends StatelessWidget {
  const DonorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("F2F1F6"),
        appBar: Header(),
        body: _DonorPage());
  }
}

class _DonorPage extends ConsumerWidget {
  const _DonorPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncearthquakes = ref.watch(earthquakeProvider);

    final earthquakes = asyncearthquakes.value;

    if (!(asyncearthquakes.hasValue && earthquakes != null)) {
      if (asyncearthquakes.isLoading) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Center(
          child: Text("Bir hata oluştu"),
        );
      }
    }

    return RefreshIndicator(
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
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Wrap(
                    runSpacing: 12,
                    children: const [RequestContainer()],
                  ),
                ),
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
    );
  }
}
