// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EarthQuake _$$_EarthQuakeFromJson(Map<String, dynamic> json) =>
    _$_EarthQuake(
      ID: json['ID'] as String,
      MapImage: json['MapImage'] as String,
      Time: json['Time'] as String,
      Magnitude: json['Magnitude'] as String,
      MagnitudeType: json['MagnitudeType'] as String,
      Latitude: json['Latitude'] as String,
      Longitude: json['Longitude'] as String,
      Depth: json['Depth'] as String,
      Region: json['Region'] as String,
      AM: json['AM'] as String,
      LastUpdate: json['LastUpdate'] as String,
    );

Map<String, dynamic> _$$_EarthQuakeToJson(_$_EarthQuake instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'MapImage': instance.MapImage,
      'Time': instance.Time,
      'Magnitude': instance.Magnitude,
      'MagnitudeType': instance.MagnitudeType,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'Depth': instance.Depth,
      'Region': instance.Region,
      'AM': instance.AM,
      'LastUpdate': instance.LastUpdate,
    };
