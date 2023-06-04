// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EarthQuake _$$_EarthQuakeFromJson(Map<String, dynamic> json) =>
    _$_EarthQuake(
      ID: json['ID'] as String,
      Time: json['Time'] as String,
      Magnitude: (json['Magnitude'] as num).toDouble(),
      Latitude: (json['Latitude'] as num).toDouble(),
      Longitude: (json['Longitude'] as num).toDouble(),
      Depth: json['Depth'] as int,
      Region: json['Region'] as String,
      City: json['City'] as String,
    );

Map<String, dynamic> _$$_EarthQuakeToJson(_$_EarthQuake instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'Time': instance.Time,
      'Magnitude': instance.Magnitude,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'Depth': instance.Depth,
      'Region': instance.Region,
      'City': instance.City,
    };
