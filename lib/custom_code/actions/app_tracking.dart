// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
// Importar dependência app_tracking_transparency
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

Future<bool> appTracking() async {
  // Verifica se é iOS, pois essa API só é relevante para iOS
  if (Platform.isIOS) {
    // Verifica o status atual da autorização de rastreamento
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;

    // Se o status já for determinado, retorna se está autorizado ou não
    if (status != TrackingStatus.notDetermined) {
      return status == TrackingStatus.authorized;
    }

    // Se o status ainda não foi determinado, solicita autorização ao usuário
    // após um pequeno delay (recomendado pela Apple)
    await Future.delayed(const Duration(milliseconds: 600));
    final TrackingStatus novoStatus =
        await AppTrackingTransparency.requestTrackingAuthorization();

    // Retorna true se o usuário autorizou, false caso contrário
    return novoStatus == TrackingStatus.authorized;
  }

  // Em plataformas não-iOS, retorna true por padrão
  // pois esta API é específica do iOS
  return true;
}
