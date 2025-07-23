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
  }) async {
    final ffApiRequestBody = '''
{
  "e_mail": "${escapeStringForJson(inputEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getIdfromEmail',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/getidfromemail',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getuserprofile',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/getuserprofile',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "p_phone": "${escapeStringForJson(inputPhone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getIdfromphone',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/getidfromphone',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "p_phone": "${escapeStringForJson(numeroDigitado)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getphonenumber',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/get_phonenumber',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "cpf_input": "${escapeStringForJson(cpf)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getcpf',
      apiUrl: 'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/get_cpf',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "crm_input": "${escapeStringForJson(crm)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getcrm',
      apiUrl: 'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/get_crm',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "e_mail": "${escapeStringForJson(emaildigitado)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getemailaddress',
      apiUrl: 'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/get_email',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUser',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/deletethisuser',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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

class UpdateUserCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? email = '',
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "e_mail": "${escapeStringForJson(email)}",
  "p_phone": "${escapeStringForJson(phone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUser',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/updatethisuser',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "phoneNumber": "${escapeStringForJson(phone)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendSMSverify',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/functions/v1/send-verification-code',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "phoneNumber": "${escapeStringForJson(phone)}",
  "code": "${escapeStringForJson(code)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'confirmSMSverify',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/functions/v1/verify-code',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendVerifyEmail',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/functions/v1/send-verification-link',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'listenVerifyEmail',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/functions/v1/listen-verification-link',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'aretheytester',
      apiUrl:
          'https://hxgbaruenomkfeeafmff.supabase.co/rest/v1/rpc/aretheytester',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4Z2JhcnVlbm9ta2ZlZWFmbWZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM4MTUzMjgsImV4cCI6MjA1OTM5MTMyOH0.V5jZLBEDXWfg2UsasoHQ6SDGIcDJLFIWBKlK8FBDows',
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
