import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '/backend/backend.dart';

import '/backend/supabase/supabase.dart';

import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final startStr = dateTimeRange.start.millisecondsSinceEpoch.toString();
  final endStr = dateTimeRange.end.millisecondsSinceEpoch.toString();
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

const _kDocIdDelimeter = '|';
String _serializeDocumentReference(DocumentReference ref) {
  final docIds = <String>[];
  DocumentReference? currentRef = ref;
  while (currentRef != null) {
    docIds.add(currentRef.id);
    // Get the parent document (catching any errors that arise).
    currentRef = safeGet<DocumentReference?>(() => currentRef?.parent.parent);
  }
  // Reverse the list to get the correct ordering.
  return docIds.reversed.join(_kDocIdDelimeter);
}

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    String? data;
    switch (paramType) {
      case ParamType.int:
        data = param.toString();
      case ParamType.double:
        data = param.toString();
      case ParamType.String:
        data = param;
      case ParamType.bool:
        data = param ? 'true' : 'false';
      case ParamType.DateTime:
        data = (param as DateTime).millisecondsSinceEpoch.toString();
      case ParamType.DateTimeRange:
        data = dateTimeRangeToString(param as DateTimeRange);
      case ParamType.LatLng:
        data = (param as LatLng).serialize();
      case ParamType.Color:
        data = (param as Color).toCssString();
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.JSON:
        data = json.encode(param);
      case ParamType.DocumentReference:
        data = _serializeDocumentReference(param as DocumentReference);
      case ParamType.Document:
        final reference = (param as FirestoreRecord).reference;
        data = _serializeDocumentReference(reference);

      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);

      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  return DateTimeRange(
    start: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.first)),
    end: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.last)),
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

DocumentReference _deserializeDocumentReference(
  String refStr,
  List<String> collectionNamePath,
) {
  var path = '';
  final docIds = refStr.split(_kDocIdDelimeter);
  for (int i = 0; i < docIds.length && i < collectionNamePath.length; i++) {
    path += '/${collectionNamePath[i]}/${docIds[i]}';
  }
  return FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'revoluna')
      .doc(path);
}

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFPlace,
  FFUploadedFile,
  JSON,

  Document,
  DocumentReference,
  SupabaseRow,

  CustomClass,
  CustomEnum,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  List<String>? collectionNamePath,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(p, paramType, false,
              collectionNamePath: collectionNamePath))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        final milliseconds = int.tryParse(param);
        return milliseconds != null
            ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
            : null;
      case ParamType.DateTimeRange:
        return dateTimeRangeFromString(param);
      case ParamType.LatLng:
        return latLngFromString(param);
      case ParamType.Color:
        return fromCssColor(param);
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.JSON:
        return json.decode(param);
      case ParamType.DocumentReference:
        return _deserializeDocumentReference(param, collectionNamePath ?? []);

      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        switch (T) {
          case VagasBeneficioRow:
            return VagasBeneficioRow(data);
          case VwVagasDisponiveisRow:
            return VwVagasDisponiveisRow(data);
          case BannerMKTRow:
            return BannerMKTRow(data);
          case BeneficioTipoRow:
            return BeneficioTipoRow(data);
          case TipovagaRow:
            return TipovagaRow(data);
          case SetoresRow:
            return SetoresRow(data);
          case GradesRow:
            return GradesRow(data);
          case EmailVerificationTokensRow:
            return EmailVerificationTokensRow(data);
          case EquipesMedicosRow:
            return EquipesMedicosRow(data);
          case EquipesRow:
            return EquipesRow(data);
          case TiposDocumentosRow:
            return TiposDocumentosRow(data);
          case CleanHospitalRow:
            return CleanHospitalRow(data);
          case CandidaturasRow:
            return CandidaturasRow(data);
          case PeriodoRow:
            return PeriodoRow(data);
          case VwTodasCandidaturasRow:
            return VwTodasCandidaturasRow(data);
          case EspecialidadesRow:
            return EspecialidadesRow(data);
          case LocalMedicoRow:
            return LocalMedicoRow(data);
          case VwVagasEspecialidadeRow:
            return VwVagasEspecialidadeRow(data);
          case SistemaLogsRow:
            return SistemaLogsRow(data);
          case VwVagasDiasContagemRow:
            return VwVagasDiasContagemRow(data);
          case VwCandidaturasPendentesRow:
            return VwCandidaturasPendentesRow(data);
          case CheckinCheckoutNofiticationsRow:
            return CheckinCheckoutNofiticationsRow(data);
          case VagasSalvasRow:
            return VagasSalvasRow(data);
          case VwVagasGradeInfoRow:
            return VwVagasGradeInfoRow(data);
          case MedicosRow:
            return MedicosRow(data);
          case EstadosBrasilRow:
            return EstadosBrasilRow(data);
          case HospitalRow:
            return HospitalRow(data);
          case CarteiraDigitalRow:
            return CarteiraDigitalRow(data);
          case VwCandidaturasPorDiaRow:
            return VwCandidaturasPorDiaRow(data);
          case VwDistribuicaoEspecialidadesRow:
            return VwDistribuicaoEspecialidadesRow(data);
          case VagasRequisitoRow:
            return VagasRequisitoRow(data);
          case VwVagasPorMesRow:
            return VwVagasPorMesRow(data);
          case CheckinCheckoutRow:
            return CheckinCheckoutRow(data);
          case GrupoRow:
            return GrupoRow(data);
          case FormasRecebimentoRow:
            return FormasRecebimentoRow(data);
          case RequisitoTipoRow:
            return RequisitoTipoRow(data);
          case PagamentosRow:
            return PagamentosRow(data);
          case VagasRecorrenciaRow:
            return VagasRecorrenciaRow(data);
          case VwOcupacaoPlantoesRow:
            return VwOcupacaoPlantoesRow(data);
          case VwRelatorioFolhapagamentoRow:
            return VwRelatorioFolhapagamentoRow(data);
          case WhatsappnumberRow:
            return WhatsappnumberRow(data);
          case VwUsuariosPorDiaRow:
            return VwUsuariosPorDiaRow(data);
          case MedicosFavoritosRow:
            return MedicosFavoritosRow(data);
          case HospitalGeofencingRow:
            return HospitalGeofencingRow(data);
          case VagasCompletoRow:
            return VagasCompletoRow(data);
          case ValidacaoDocumentosRow:
            return ValidacaoDocumentosRow(data);
          case VwVagasCandidaturasRow:
            return VwVagasCandidaturasRow(data);
          case VagasRow:
            return VagasRow(data);
          case MedicosPrecadastroRow:
            return MedicosPrecadastroRow(data);
          case UserProfileRow:
            return UserProfileRow(data);
          case CodigosdeareaRow:
            return CodigosdeareaRow(data);
          case VwDashboardMetricsRow:
            return VwDashboardMetricsRow(data);
          case VwGrupoNomeRow:
            return VwGrupoNomeRow(data);
          case EscalistaRow:
            return EscalistaRow(data);
          case LocalRow:
            return LocalRow(data);
          case NotificationsRow:
            return NotificationsRow(data);
          default:
            return null;
        }

      default:
        return null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}

Future<dynamic> Function(String) getDoc(
  List<String> collectionNamePath,
  RecordBuilder recordBuilder,
) {
  return (String ids) => _deserializeDocumentReference(ids, collectionNamePath)
      .get()
      .then((s) => recordBuilder(s));
}

Future<List<T>> Function(String) getDocList<T>(
  List<String> collectionNamePath,
  RecordBuilder<T> recordBuilder,
) {
  return (String idsList) {
    List<String> docIds = [];
    try {
      final ids = json.decode(idsList) as Iterable;
      docIds = ids.where((d) => d is String).map((d) => d as String).toList();
    } catch (_) {}
    return Future.wait(
      docIds.map(
        (ids) => _deserializeDocumentReference(ids, collectionNamePath)
            .get()
            .then((s) => recordBuilder(s)),
      ),
    ).then((docs) => docs.where((d) => d != null).map((d) => d!).toList());
  };
}
