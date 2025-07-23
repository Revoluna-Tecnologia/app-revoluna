// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> insertCandidaturas(
  String medicoId,
  String vagasId,
  double vagasValor,
) async {
  try {
    final response = await SupaFlow.client
        .from('candidaturas')
        .insert({
          'medico_id': medicoId,
          'vagas_id': vagasId,
          'candidatura_status': 'PENDENTE',
          'candidaturas_updateby': medicoId,
          'vagas_valor': vagasValor.toInt(),
        })
        .select('candidaturas_id')
        .single();

    return 'success';
  } catch (error) {
    if (error is PostgrestException) {
      // Extrai apenas a mensagem, removendo informações técnicas
      String message = error.message;

      return message;
    }

    return null;
  }
}
