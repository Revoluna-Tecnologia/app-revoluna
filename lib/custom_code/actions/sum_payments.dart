// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> sumPayments(List<double>? valorList) async {
  // Se a lista for nula ou vazia, retorne 0
  if (valorList == null || valorList.isEmpty) {
    return 0.0;
  }

  // Inicializa a variável para armazenar a soma
  double totalSum = 0.0;

  // Itera por cada valor na lista e soma
  for (double valor in valorList) {
    // Adiciona cada valor à soma total
    totalSum += valor;
  }

  // Retorna a soma calculada
  return totalSum;

  // Alternativa usando reduce (código mais compacto):
  // return valorList.reduce((sum, value) => sum + value);
}
