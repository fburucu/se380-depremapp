// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'earthquake.freezed.dart';
part 'earthquake.g.dart';

@freezed
class EarthQuake with _$EarthQuake {
  const factory EarthQuake({
    required String ID,
    required String MapImage,
    required String Time,
    required String Magnitude,
    required String MagnitudeType,
    required String Latitude,
    required String Longitude,
    required String Depth,
    required String Region,
    required String AM,
    required String LastUpdate,
  }) = _EarthQuake;

  factory EarthQuake.fromJson(Map<String, dynamic> json) =>
      _$EarthQuakeFromJson(json);
}
