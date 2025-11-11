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

/// Custom action to load clean hospital terms from Supabase
/// and save them to App State for use in the cleanHospitalName function
Future<void> loadCleanHospitalTerms() async {
  try {
    // Busca os termos da tabela clean_hospital no Supabase
    final response = await SupaFlow.client
        .from('clean_hospital')
        .select('terms')
        .order('id', ascending: true);

    // Extrai os termos da resposta e converte para List<String>
    List<String> terms = [];
    if (response is List) {
      for (var row in response) {
        if (row is Map<String, dynamic> && row['terms'] != null) {
          final term = row['terms'].toString();
          if (term.isNotEmpty) {
            terms.add(term);
          }
        }
      }
    }

    // Salva os termos no App State
    FFAppState().update(() {
      FFAppState().cleanHospital = terms;
    });
  } catch (e) {
    // Em caso de erro, define uma lista vazia no App State
    FFAppState().update(() {
      FFAppState().cleanHospital = [];
    });
  }
}
