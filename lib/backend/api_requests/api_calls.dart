import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetIdfromEmailCall {
  static Future<ApiCallResponse> call({
    String? inputEmail = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "e_mail": "${escapeStringForJson(inputEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getIdfromEmail',
      apiUrl: '${apiurl}/rest/v1/rpc/getidfromemail',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetuserprofileCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getuserprofile',
      apiUrl: '${apiurl}/rest/v1/rpc/getuserprofile',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetIdfromphoneCall {
  static Future<ApiCallResponse> call({
    String? inputPhone = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "p_phone": "${escapeStringForJson(inputPhone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getIdfromphone',
      apiUrl: '${apiurl}/rest/v1/rpc/getidfromphone',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetphonenumberCall {
  static Future<ApiCallResponse> call({
    String? numeroDigitado = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "p_phone": "${escapeStringForJson(numeroDigitado)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getphonenumber',
      apiUrl: '${apiurl}/rest/v1/rpc/get_phonenumber',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetcpfCall {
  static Future<ApiCallResponse> call({
    String? cpf = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "cpf_input": "${escapeStringForJson(cpf)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getcpf',
      apiUrl: '${apiurl}/rest/v1/rpc/get_cpf',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetcrmCall {
  static Future<ApiCallResponse> call({
    String? crm = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "crm_input": "${escapeStringForJson(crm)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getcrm',
      apiUrl: '${apiurl}/rest/v1/rpc/get_crm',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetemailaddressCall {
  static Future<ApiCallResponse> call({
    String? emaildigitado = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "e_mail": "${escapeStringForJson(emaildigitado)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getemailaddress',
      apiUrl: '${apiurl}/rest/v1/rpc/get_email',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUser',
      apiUrl: '${apiurl}/rest/v1/rpc/deletethisuser',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendSMSverifyCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "phoneNumber": "${escapeStringForJson(phone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendSMSverify',
      apiUrl: '${apiurl}/functions/v1/send-verification-code',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateVerifiedPhoneCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? areaCodeIndex = '',
    String? phone = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "areacodeindex": "${escapeStringForJson(areaCodeIndex)}",
  "telefone": "${escapeStringForJson(phone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateVerifiedPhone',
      apiUrl: '${apiurl}/rest/v1/rpc/update_phone_forotp',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConfirmSMSverifyCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? code = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "phoneNumber": "${escapeStringForJson(phone)}",
  "code": "${escapeStringForJson(code)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'confirmSMSverify',
      apiUrl: '${apiurl}/functions/v1/verify-code',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendVerifyEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendVerifyEmail',
      apiUrl: '${apiurl}/functions/v1/send-verification-link',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListenVerifyEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'listenVerifyEmail',
      apiUrl: '${apiurl}/functions/v1/listen-verification-link',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AretheytesterCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'aretheytester',
      apiUrl: '${apiurl}/rest/v1/rpc/aretheytester',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificationreadCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? apikey,
    String? apiurl,
  }) async {
    apikey ??= FFDevEnvironmentValues().supabaseAnonKey;
    apiurl ??= FFDevEnvironmentValues().supabaseUrl;

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'notificationread',
      apiUrl: '${apiurl}/functions/v1/notification-read',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
