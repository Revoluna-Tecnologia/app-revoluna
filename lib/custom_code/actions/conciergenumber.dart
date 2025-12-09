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

Future conciergenumber() async {
  try {
    final response =
        await SupaFlow.client.from('whatsapp_number').select('number');

    String numberToSet;
    if (response != null && response.isNotEmpty) {
      numberToSet = response[0]['number'];
    } else {
      numberToSet = '5511969193194'; // Valor padrão se a lista estiver vazia
    }

    // Define o valor na appState
    FFAppState().update(() {
      FFAppState().concierge = numberToSet;
    });
  } catch (error) {
    print('Erro ao buscar número: $error');

    // Define o valor padrão na appState em caso de erro
    FFAppState().update(() {
      FFAppState().concierge = '5511969193194';
    });
  }
}
