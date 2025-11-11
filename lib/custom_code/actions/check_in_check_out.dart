// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/flutter_flow/custom_functions.dart'
    as functions; // Imports custom functions

Future<String?> checkInCheckOut(String vagasId, double lat, double lon,
    String? justification, bool inOrOut) async {
  LatLng location = await getCurrentUserLocation(
      defaultLocation: LatLng(0.0, 0.0), cached: true);

  double latUser = location!.latitude;
  double lonUser = location!.longitude;

  String now = DateTime.now().toIso8601String();

  String distString = functions.distanceCalc(lat, lon, location)!;

  final unit = distString.split(' ')[1];

  double distDouble =
      double.parse(distString.replaceAll(RegExp(r'[a-zA-Z]'), '').trim());

  double distMeters = (unit == 'km') ? distDouble * 1000 : distDouble;

  if (distMeters > 100) {
    return 'ERRO Distância maior que a permitida. Verifique o endereço na sessão "Como chegar".';
  }

  final user = SupaFlow.client.auth.currentUser;

  try {
    final response = inOrOut
        ? await SupaFlow.client
            .from('checkin_checkout')
            .insert({
              'medico_id': user!.id,
              'vagas_id': vagasId,
              'checkin': now,
              'checkin_latitude': latUser,
              'checkin_longitude': lonUser,
              'checkin_justificativa': justification,
            })
            .select('checkin')
            .single()
        : await SupaFlow.client
            .from('checkin_checkout')
            .update({
              'checkout': now,
              'checkout_latitude': latUser,
              'checkout_longitude': lonUser,
              'checkout_justificativa': justification,
              'updated_at': now,
              'updated_by': user!.id
            })
            .eq('vagas_id', vagasId)
            .eq('medico_id', user.id)
            .select('checkout')
            .single();

    if (response != null && response is Map<String, dynamic>) {
      if (inOrOut) {
        // Check-in: verifica se o campo 'checkin' existe e não é null
        return response.containsKey('checkin') && response['checkin'] != null
            ? 'SUCESSO'
            : 'ERRO Algo inesperado aconteceu, entre em contato com seu gestor';
      } else {
        // Check-out: verifica se o campo 'checkout' existe e não é null
        return response.containsKey('checkout') && response['checkout'] != null
            ? 'SUCESSO'
            : 'ERRO Algo inesperado aconteceu, entre em contato com seu gestor';
      }
    } else {
      return 'ERRO Algo inesperado aconteceu, entre em contato com seu gestor.';
    }
  } catch (error) {
    if (error is PostgrestException) {
      // Extrai apenas a mensagem, removendo informações técnicas
      String message = error.message;

      print('$message');

      return message;
    }

    return 'ERRO Algo inesperado aconteceu, entre em contato com seu gestor.';
  }
}
