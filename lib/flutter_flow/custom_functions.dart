import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? aplicarmascara(
  String? valor,
  String mascara,
) {
  if (valor == null) return null;

  String somenteNumeros = valor.replaceAll(RegExp(r'\D'), '');

  var resultado = StringBuffer();
  int indexValor = 0;

  for (int i = 0; i < mascara.length; i++) {
    if (mascara[i] == '#') {
      if (indexValor < somenteNumeros.length) {
        resultado.write(somenteNumeros[indexValor]);
        indexValor++;
      } else {
        break;
      }
    } else {
      if (indexValor < somenteNumeros.length) {
        resultado.write(mascara[i]);
      }
    }
  }

  return resultado.toString();
}

String? onlynumbers(String? valor) {
  if (valor == null) return null;

  String somenteNumeros = valor.replaceAll(RegExp(r'\D'), '');

  return somenteNumeros;
}

DateTime lastDayofWeek() {
  final now = DateTime.now();
  // Find the days remaining until the end of the week (Saturday)
  // In Dart, weekday is 1 for Monday through 7 for Sunday
  final daysUntilEndOfWeek = (DateTime.saturday - now.weekday) % 7;
  // If today is already Saturday, we don't add any days
  final addDays = daysUntilEndOfWeek == 0 ? 0 : daysUntilEndOfWeek;
  // Return the date of the last day of current week (Saturday)
  return DateTime(now.year, now.month, now.day + addDays);
}

double sumList(List<int>? list) {
  if (list == null || list.isEmpty) {
    return 0.0;
  }

  return list.fold(
      0.0, (sum, item) => sum + (item is num ? item.toDouble() : 0.0));
}

Color getColorFromString(String stringToColor) {
// Esta função gera uma cor única e consistente a partir de uma string

  // Calcular um valor hash da string
  int hash = 0;
  for (var i = 0; i < stringToColor.length; i++) {
    hash = stringToColor.codeUnitAt(i) + ((hash << 5) - hash);
  }

  // Converter para um formato de cor
  // Usamos 0xFF como prefixo para garantir opacidade total (255)
  // e então usamos os bits do hash para gerar componentes RGB
  final int red = ((hash & 0xFF0000) >> 16);
  final int green = ((hash & 0x00FF00) >> 8);
  final int blue = (hash & 0x0000FF);

  // Vamos garantir que as cores não sejam muito claras (adicionando um mínimo)
  // e tenham uma boa saturação
  final Color color = Color.fromRGBO(
    red.clamp(
        60, 200), // Limitando vermelho para evitar cores muito claras/escuras
    green.clamp(
        60, 200), // Limitando verde para evitar cores muito claras/escuras
    blue.clamp(
        60, 200), // Limitando azul para evitar cores muito claras/escuras
    1.0, // Opacidade total
  );

  return color;
}

// Exemplo de uso:
void exemploUso() {
  final String hospital1 = "Hospital Santa Casa";
  final String hospital2 = "Hospital Albert Einstein";
  final String hospital3 = "Hospital Sírio-Libanês";

  // Estas cores serão sempre as mesmas para cada nome
  final Color cor1 = getColorFromString(hospital1);
  final Color cor2 = getColorFromString(hospital2);
  final Color cor3 = getColorFromString(hospital3);

  print('Cor para $hospital1: ${cor1.toString()}');
  print('Cor para $hospital2: ${cor2.toString()}');
  print('Cor para $hospital3: ${cor3.toString()}');

// Para usar no FlutterFlow, você pode adicionar isso como uma função personalizada
// e chamar getColorFromString com o nome do hospital sempre que precisar da cor.
}

DateTime eighteenYearsAgo() {
  // Obtém a data atual
  DateTime dataAtual = DateTime.now();

  // Subtrai 18 anos da data atual
  DateTime dataDezoitoAnosAtras = DateTime(
    dataAtual.year - 18,
    dataAtual.month,
    dataAtual.day,
  );

  return dataDezoitoAnosAtras;
}
