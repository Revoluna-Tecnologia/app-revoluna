// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<String?> geoDistance(
  double? latDest,
  double? lonDest,
  LatLng? location,
) async {
  if (latDest == null || lonDest == null || location == null) {
    return 'erro';
  }

  try {
    double distance = Geolocator.distanceBetween(
      location.latitude,
      location.longitude,
      latDest,
      lonDest,
    );

    // Calcular a distância em km (sem casas decimais)
    double km = distance / 1000;

    // Se a distância for menor que 1 km, retorna em metros com a sigla "m"
    if (km < 1) {
      return '${distance.round()} m';
    } else {
      return '${km.round()} km';
    }
  } catch (error) {
    return 'erro';
  }
}
