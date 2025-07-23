// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

bool isValidCPF(String cpf) {
  // 1. Remove qualquer caracter que não seja dígito
  String numbers = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  // 2. Verifica se tem 11 dígitos
  if (numbers.length != 11) {
    return false;
  }

  // 3. Verifica se todos os dígitos são iguais
  if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) {
    return false;
  }

  // 4. Cálculo do primeiro dígito verificador
  int sum = 0;
  for (int i = 0; i < 9; i++) {
    sum += int.parse(numbers[i]) * (10 - i);
  }
  int remainder = sum % 11;
  int firstVerifier = remainder < 2 ? 0 : 11 - remainder;
  if (firstVerifier != int.parse(numbers[9])) {
    return false;
  }

  // 5. Cálculo do segundo dígito verificador
  sum = 0;
  for (int i = 0; i < 10; i++) {
    sum += int.parse(numbers[i]) * (11 - i);
  }
  remainder = sum % 11;
  int secondVerifier = remainder < 2 ? 0 : 11 - remainder;
  if (secondVerifier != int.parse(numbers[10])) {
    return false;
  }

  // 6. Se passou de todas as validações, é válido
  return true;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
