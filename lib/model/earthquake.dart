// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'earthquake.freezed.dart';
part 'earthquake.g.dart';

@freezed
class EarthQuake with _$EarthQuake {
  const factory EarthQuake({
    required String ID,
    required String Time,
    required double Magnitude,
    required double Latitude,
    required double Longitude,
    required int Depth,
    required String Region,
    required String City,
  }) = _EarthQuake;

  factory EarthQuake.fromJson(Map<String, dynamic> json) =>
      _$EarthQuakeFromJson(json);
}
