// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:latlong2/latlong.dart';

import '../../domain/entities/geocode_entity.dart';

class GeocodeModel extends GeocodeEntity {
  GeocodeModel({
    required super.name,
    required super.latLng,
  });

factory GeocodeModel.fromJson(Map<String, dynamic> json) {
  return GeocodeModel(
    name: json['name'],
    latLng: LatLng(json['lat'], json['lon']),
  );
}
}
