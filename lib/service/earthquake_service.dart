import 'dart:convert';

import 'package:depremapp/model/earthquake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const apiURL = "https://secimharitam.net/deprem/";

final earthquakeserviceProvider =
    ChangeNotifierProvider((ref) => EarthquakeService());

final earthquakeProvider = FutureProvider((ref) {
  final earthquakeService = ref.watch(earthquakeserviceProvider);
  return earthquakeService.fetchEarthquakes();
});

class EarthquakeService extends ChangeNotifier {
  Future<List<EarthQuake>> fetchEarthquakes() async {
    final response =
        await http.get(Uri.parse('https://secimharitam.net/deprem/index.php'));

    print(response);

    final listofMaps = jsonDecode(response.body);

    // final response = await http.get(Uri.parse(apiURL));

    // print(response.body);

    // final listofMaps = jsonDecode(response.body);

    if (listofMaps is List) {
      print("yes");

      var list = listofMaps.map((e) => EarthQuake.fromJson(e)).toList();

      return list;
    } else {
      return [];
    }
  }
}
