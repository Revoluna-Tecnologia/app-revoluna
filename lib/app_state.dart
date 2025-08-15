import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _profilepicture = prefs.getString('ff_profilepicture') ?? _profilepicture;
    });
    _safeInit(() {
      _displayName = prefs.getString('ff_displayName') ?? _displayName;
    });
    _safeInit(() {
      _gender = prefs.getString('ff_gender') ?? _gender;
    });
    _safeInit(() {
      _estadoUF = prefs.getInt('ff_estadoUF') ?? _estadoUF;
    });
    _safeInit(() {
      _valuesPrivacy = prefs.getBool('ff_valuesPrivacy') ?? _valuesPrivacy;
    });
    _safeInit(() {
      _concierge = prefs.getString('ff_concierge') ?? _concierge;
    });
    _safeInit(() {
      _apnToken = prefs.getString('ff_apnToken') ?? _apnToken;
    });
    _safeInit(() {
      _unreadNotifications =
          prefs.getBool('ff_unreadNotifications') ?? _unreadNotifications;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _fromExplorar = false;
  bool get fromExplorar => _fromExplorar;
  set fromExplorar(bool value) {
    _fromExplorar = value;
  }

  bool _fromHome = false;
  bool get fromHome => _fromHome;
  set fromHome(bool value) {
    _fromHome = value;
  }

  String _userRole = '';
  String get userRole => _userRole;
  set userRole(String value) {
    _userRole = value;
  }

  LatLng? _location = LatLng(-23.6854644, -46.5482938);
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  bool _wasUser = false;
  bool get wasUser => _wasUser;
  set wasUser(bool value) {
    _wasUser = value;
  }

  String _inputAreacode = '';
  String get inputAreacode => _inputAreacode;
  set inputAreacode(String value) {
    _inputAreacode = value;
  }

  String _inputPhone = '';
  String get inputPhone => _inputPhone;
  set inputPhone(String value) {
    _inputPhone = value;
  }

  String _inputEmail = '';
  String get inputEmail => _inputEmail;
  set inputEmail(String value) {
    _inputEmail = value;
  }

  int _inputAreacodeIndex = 0;
  int get inputAreacodeIndex => _inputAreacodeIndex;
  set inputAreacodeIndex(int value) {
    _inputAreacodeIndex = value;
  }

  String _profilepicture = '';
  String get profilepicture => _profilepicture;
  set profilepicture(String value) {
    _profilepicture = value;
    prefs.setString('ff_profilepicture', value);
  }

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String value) {
    _displayName = value;
    prefs.setString('ff_displayName', value);
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    prefs.setString('ff_gender', value);
  }

  int _estadoUF = 23;
  int get estadoUF => _estadoUF;
  set estadoUF(int value) {
    _estadoUF = value;
    prefs.setInt('ff_estadoUF', value);
  }

  bool _valuesPrivacy = false;
  bool get valuesPrivacy => _valuesPrivacy;
  set valuesPrivacy(bool value) {
    _valuesPrivacy = value;
    prefs.setBool('ff_valuesPrivacy', value);
  }

  String _concierge = '5511969193194';
  String get concierge => _concierge;
  set concierge(String value) {
    _concierge = value;
    prefs.setString('ff_concierge', value);
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  String _apnToken = '';
  String get apnToken => _apnToken;
  set apnToken(String value) {
    _apnToken = value;
    prefs.setString('ff_apnToken', value);
  }

  bool _unreadNotifications = false;
  bool get unreadNotifications => _unreadNotifications;
  set unreadNotifications(bool value) {
    _unreadNotifications = value;
    prefs.setBool('ff_unreadNotifications', value);
  }

  DateTime? _selectedDay = DateTime.fromMillisecondsSinceEpoch(1752030000000);
  DateTime? get selectedDay => _selectedDay;
  set selectedDay(DateTime? value) {
    _selectedDay = value;
  }

  String _pendingDeeplinkUrl = '';
  String get pendingDeeplinkUrl => _pendingDeeplinkUrl;
  set pendingDeeplinkUrl(String value) {
    _pendingDeeplinkUrl = value;
  }

  bool _appFullyLoaded = false;
  bool get appFullyLoaded => _appFullyLoaded;
  set appFullyLoaded(bool value) {
    _appFullyLoaded = value;
  }

  final _cleanHospitalTermsManager =
      StreamRequestManager<List<CleanHospitalRow>>();
  Stream<List<CleanHospitalRow>> cleanHospitalTerms({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CleanHospitalRow>> Function() requestFn,
  }) =>
      _cleanHospitalTermsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCleanHospitalTermsCache() => _cleanHospitalTermsManager.clear();
  void clearCleanHospitalTermsCacheKey(String? uniqueKey) =>
      _cleanHospitalTermsManager.clearRequest(uniqueKey);

  final _vagasCandidaturasManager =
      FutureRequestManager<List<VwVagasCandidaturasRow>>();
  Future<List<VwVagasCandidaturasRow>> vagasCandidaturas({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VwVagasCandidaturasRow>> Function() requestFn,
  }) =>
      _vagasCandidaturasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVagasCandidaturasCache() => _vagasCandidaturasManager.clear();
  void clearVagasCandidaturasCacheKey(String? uniqueKey) =>
      _vagasCandidaturasManager.clearRequest(uniqueKey);

  final _estadosManager = FutureRequestManager<List<EstadosBrasilRow>>();
  Future<List<EstadosBrasilRow>> estados({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EstadosBrasilRow>> Function() requestFn,
  }) =>
      _estadosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEstadosCache() => _estadosManager.clear();
  void clearEstadosCacheKey(String? uniqueKey) =>
      _estadosManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
