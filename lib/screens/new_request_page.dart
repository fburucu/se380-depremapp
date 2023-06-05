import 'package:depremapp/model/earthquake.dart';
import 'package:depremapp/screens/victim_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:depremapp/components/static/header_component.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../service/earthquake_service.dart';

class NewRequest extends ConsumerStatefulWidget {
  const NewRequest({super.key});

  @override
  ConsumerState<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends ConsumerState<NewRequest> {
  final victimNameController = TextEditingController();
  final victimPhoneController = TextEditingController();
  final victimAddressController = TextEditingController();
  final victimNeedsController = TextEditingController();

  String selectedEarthquake = '';

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Yeni Talep",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: HexColor('222B45'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Ad Soyad",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: HexColor('222B45'),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: victimNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adınız Soyadınız',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Telefon Numarası',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: HexColor('222B45'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: victimPhoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telefon Numaranız',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Adres',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: HexColor('222B45'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: victimAddressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adresiniz',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'İhtiyaçlarınız',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: HexColor('222B45'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: victimNeedsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'İhtiyaçlarınız..',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Deprem',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: HexColor('222B45'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Deprem',
                        ),
                        items: earthquakes
                            .map((e) => DropdownMenuItem(
                                value: e.ID, child: Text(e.Region)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEarthquake = value!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VictimPage()),
                        );
                      },
                      child: const Text("İptal"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black38,
                      ),
                      onPressed: () async {
                        if (_checkerFields()) {
                          Map<String, dynamic> victims = {
                            'name': victimNameController.text,
                            'phone': victimPhoneController.text,
                            'address': victimAddressController.text,
                            'needs': victimNeedsController.text,
                            'earthquake': selectedEarthquake == ""
                                ? null
                                : selectedEarthquake,
                          };
                          CollectionReference victimsCollection =
                              FirebaseFirestore.instance.collection('victims');
                          var added = await victimsCollection.add(victims);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VictimPage()),
                          );
                        } else {}
                      },
                      child: const Text("Kayıt Et"),
                    ),
                  ),
                ],
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  bool _checkerFields() {
    if (victimNeedsController.text.isEmpty ||
        victimAddressController.text.isEmpty ||
        victimPhoneController.text.isEmpty ||
        victimNameController.text.isEmpty) {
      setState(() {
        errorMessage = 'Lütfen tüm alanları doldurun';
      });
      return false;
    }
    return true;
  }
}
