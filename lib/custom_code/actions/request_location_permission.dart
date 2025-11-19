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

import 'index.dart'; // Imports other custom actions

import 'package:permission_handler/permission_handler.dart';

/// Verifica se a permissão de localização está concedida
/// Retorna true se concedida (granted ou limited), false caso contrário
Future<bool> checkLocationPermission() async {
  final status = await Permission.location.status;
  return status.isGranted || status.isLimited;
}

/// Solicita permissão de localização, incluindo casos onde foi negada
/// permanentemente Retorna true se a permissão foi concedida, false caso
/// contrário
Future<bool> requestLocationPermission() async {
  final status = await Permission.location.status;

  // Se já tem permissão, retorna true
  if (status.isGranted || status.isLimited) {
    return true;
  }

  // Se foi permanentemente negada, abre as configurações do sistema
  if (status.isPermanentlyDenied) {
    // Abre as configurações do app para o usuário habilitar manualmente
    await openAppSettings();

    // Após abrir as configurações, retorna false pois o usuário precisa
    // conceder a permissão manualmente nas configurações
    // O app pode verificar novamente quando voltar ao foreground
    return false;
  }

  // Se foi apenas negada ou ainda não foi pedida, solicita a permissão
  final result = await Permission.location.request();
  return result.isGranted || result.isLimited;
}
