import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

double sumList(List<int>? list) {
  if (list == null || list.isEmpty) {
    return 0.0;
  }

  return list.fold(
      0.0, (sum, item) => sum + (item is num ? item.toDouble() : 0.0));
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

bool inThisWeek(DateTime inputDate) {
  // Pegando a data de hoje sem o horário
  final today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  // Tirando o horário da data inputada para normalizar
  final normDate = DateTime(inputDate.year, inputDate.month, inputDate.day);

  // In Dart, weekday is 1 for Monday through 7 for Sunday
  final daysUntilEndOfWeek = (DateTime.saturday - today.weekday) % 7;
  // If today is already Saturday, we don't add any days
  final addDays = daysUntilEndOfWeek == 0 ? 0 : daysUntilEndOfWeek;
  // Date of the last day of current week (Saturday)
  final weekEnd = DateTime(today.year, today.month, today.day + addDays);

  return normDate.compareTo(today) >= 0 && normDate.compareTo(weekEnd) <= 0;
}

String? distanceCalc(
  double lat,
  double lon,
  LatLng location,
) {
  double latUser = location.latitude;
  double lonUser = location.longitude;

  // Raio da Terra em quilômetros
  const double earthRadius = 6371.0;

  /// Converte graus para radianos
  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  /// Calcula a distância entre duas coordenadas usando a fórmula de Haversine
  /// Retorna a distância em quilômetros

  // Converte graus para radianos
  double dLat = _degreesToRadians(lat - latUser);
  double dLon = _degreesToRadians(lon - lonUser);

  double lat1Rad = _degreesToRadians(latUser);
  double lat2Rad = _degreesToRadians(lat);

  // Fórmula de Haversine
  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.sin(dLon / 2) *
          math.sin(dLon / 2) *
          math.cos(lat1Rad) *
          math.cos(lat2Rad);

  // Distância em quilômetros
  double km = 2 * math.asin(math.sqrt(a)) * earthRadius;
  double m = km * 1000;

  // Se a distância for menor que 1 km, retorna em metros com a sigla "m"
  if (km < 0.1) {
    return '${m.toStringAsFixed(0)} m';
  } else {
    return '${km.toStringAsFixed(0)} km';
  }
}

String cleanHospitalName(
  String hospitalName,
  List<String> termsToRemove,
) {
  String cleanName = hospitalName.trim();

  // Remove os termos da lista, preservando case das outras palavras
  for (String term in termsToRemove) {
    // Regex para remover o termo no início, no final ou isolado
    final RegExp regex =
        RegExp('\\b${RegExp.escape(term)}\\b', caseSensitive: false);
    cleanName = cleanName.replaceAll(regex, '').trim();
  }

  // Remove espaços múltiplos e vírgulas/hífen no início ou final
  cleanName = cleanName
      .replaceAll(RegExp(r'\s+'), ' ')
      .replaceAll(RegExp(r'^[,\-\s]+|[,\-\s]+$'), '')
      .trim();

  // Se o nome ficou vazio após a limpeza, retorna o nome original
  if (cleanName.isEmpty) {
    return hospitalName.trim();
  }

  return cleanName.replaceAll('Hospital', 'H.');
}

List<VwVagasCandidaturasRow> sortByLocation(
  LatLng location,
  List<VwVagasCandidaturasRow> vagas,
  bool ascending,
) {
  if (vagas.isEmpty) return vagas;

  double latUser = location.latitude;
  double lonUser = location.longitude;

  // Raio da Terra em quilômetros
  const double earthRadius = 6371.0;

  // Função auxiliar para calcular distância usando fórmula de Haversine
  double calculateDistance(double lat, double lon) {
    if (lat == 0.0 && lon == 0.0) {
      return double.infinity; // Coloca vagas sem coordenadas no final
    }

    // Converte graus para radianos
    double dLat = (lat - latUser) * math.pi / 180;
    double dLon = (lon - lonUser) * math.pi / 180;

    double lat1Rad = latUser * math.pi / 180;
    double lat2Rad = lat * math.pi / 180;

    // Fórmula de Haversine
    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.sin(dLon / 2) *
            math.sin(dLon / 2) *
            math.cos(lat1Rad) *
            math.cos(lat2Rad);

    // Distância em quilômetros
    double distance = 2 * math.asin(math.sqrt(a)) * earthRadius;
    return distance;
  }

  // Cria uma cópia da lista para não modificar a original
  List<VwVagasCandidaturasRow> sortedVagas = List.from(vagas);

  // Ordena por distância
  sortedVagas.sort((a, b) {
    double distanceA = calculateDistance(
      a.hospitalLat ?? 0.0,
      a.hospitalLog ?? 0.0,
    );
    double distanceB = calculateDistance(
      b.hospitalLat ?? 0.0,
      b.hospitalLog ?? 0.0,
    );

    // Se ascending for true, ordena crescente (mais próximo primeiro)
    // Se ascending for false, ordena decrescente (mais distante primeiro)
    return ascending
        ? distanceA.compareTo(distanceB)
        : distanceB.compareTo(distanceA);
  });

  return sortedVagas;
}

List<VwVagasCandidaturasRow> sortByPayment(
  List<VwVagasCandidaturasRow> vagas,
  bool ascending,
) {
  if (vagas.isEmpty) return vagas;

  // Cria uma cópia da lista para não modificar a original
  List<VwVagasCandidaturasRow> sortedVagas = List.from(vagas);

  int receiveDays(DateTime? jobDay, DateTime? paymentDay) {
    return paymentDay!.difference(jobDay!).inDays;
  }

  // Ordena por data pagamento
  sortedVagas.sort((a, b) {
    int daysA = receiveDays(a.vagasData, a.vagasDatapagamento);
    int daysB = receiveDays(b.vagasData, b.vagasDatapagamento);

    // Se ascending for true, ordena crescente (mais próximo primeiro)
    // Se ascending for false, ordena decrescente (mais distante primeiro)
    return ascending ? daysA.compareTo(daysB) : daysB.compareTo(daysA);
  });
  return sortedVagas;
}

LatLng? map(
  double lat,
  double lon,
) {
  return LatLng.new(lat, lon);
}

DateTime? currentDate() {
  DateTime now = new DateTime.now();
  return new DateTime(now.year, now.month, now.day);
}
