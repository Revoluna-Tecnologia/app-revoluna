import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _profilepicture =
          await secureStorage.getString('ff_profilepicture') ?? _profilepicture;
    });
    await _safeInitAsync(() async {
      _displayName =
          await secureStorage.getString('ff_displayName') ?? _displayName;
    });
    await _safeInitAsync(() async {
      _gender = await secureStorage.getString('ff_gender') ?? _gender;
    });
    await _safeInitAsync(() async {
      _estadoUF = await secureStorage.getString('ff_estadoUF') ?? _estadoUF;
    });
    await _safeInitAsync(() async {
      _estadoUFIndex =
          await secureStorage.getInt('ff_estadoUFIndex') ?? _estadoUFIndex;
    });
    await _safeInitAsync(() async {
      _valuesPrivacy =
          await secureStorage.getBool('ff_valuesPrivacy') ?? _valuesPrivacy;
    });
    await _safeInitAsync(() async {
      _concierge = await secureStorage.getString('ff_concierge') ?? _concierge;
    });
    await _safeInitAsync(() async {
      _apnToken = await secureStorage.getString('ff_apnToken') ?? _apnToken;
    });
    await _safeInitAsync(() async {
      _unreadNotifications =
          await secureStorage.getBool('ff_unreadNotifications') ??
              _unreadNotifications;
    });
    await _safeInitAsync(() async {
      _selectedDay = await secureStorage.read(key: 'ff_selectedDay') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_selectedDay'))!)
          : _selectedDay;
    });
    await _safeInitAsync(() async {
      _specialialityIndex =
          await secureStorage.getInt('ff_specialialityIndex') ??
              _specialialityIndex;
    });
    await _safeInitAsync(() async {
      _cleanHospital = await secureStorage.getStringList('ff_cleanHospital') ??
          _cleanHospital;
    });
    await _safeInitAsync(() async {
      _CRMCheck = await secureStorage.getBool('ff_CRMCheck') ?? _CRMCheck;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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
    secureStorage.setString('ff_profilepicture', value);
  }

  void deleteProfilepicture() {
    secureStorage.delete(key: 'ff_profilepicture');
  }

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String value) {
    _displayName = value;
    secureStorage.setString('ff_displayName', value);
  }

  void deleteDisplayName() {
    secureStorage.delete(key: 'ff_displayName');
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    secureStorage.setString('ff_gender', value);
  }

  void deleteGender() {
    secureStorage.delete(key: 'ff_gender');
  }

  String _estadoUF = 'SP';
  String get estadoUF => _estadoUF;
  set estadoUF(String value) {
    _estadoUF = value;
    secureStorage.setString('ff_estadoUF', value);
  }

  void deleteEstadoUF() {
    secureStorage.delete(key: 'ff_estadoUF');
  }

  int _estadoUFIndex = 23;
  int get estadoUFIndex => _estadoUFIndex;
  set estadoUFIndex(int value) {
    _estadoUFIndex = value;
    secureStorage.setInt('ff_estadoUFIndex', value);
  }

  void deleteEstadoUFIndex() {
    secureStorage.delete(key: 'ff_estadoUFIndex');
  }

  bool _valuesPrivacy = false;
  bool get valuesPrivacy => _valuesPrivacy;
  set valuesPrivacy(bool value) {
    _valuesPrivacy = value;
    secureStorage.setBool('ff_valuesPrivacy', value);
  }

  void deleteValuesPrivacy() {
    secureStorage.delete(key: 'ff_valuesPrivacy');
  }

  String _concierge = '5511969193194';
  String get concierge => _concierge;
  set concierge(String value) {
    _concierge = value;
    secureStorage.setString('ff_concierge', value);
  }

  void deleteConcierge() {
    secureStorage.delete(key: 'ff_concierge');
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
    secureStorage.setString('ff_apnToken', value);
  }

  void deleteApnToken() {
    secureStorage.delete(key: 'ff_apnToken');
  }

  bool _unreadNotifications = false;
  bool get unreadNotifications => _unreadNotifications;
  set unreadNotifications(bool value) {
    _unreadNotifications = value;
    secureStorage.setBool('ff_unreadNotifications', value);
  }

  void deleteUnreadNotifications() {
    secureStorage.delete(key: 'ff_unreadNotifications');
  }

  DateTime? _selectedDay = DateTime.fromMillisecondsSinceEpoch(1761334800000);
  DateTime? get selectedDay => _selectedDay;
  set selectedDay(DateTime? value) {
    _selectedDay = value;
    value != null
        ? secureStorage.setInt('ff_selectedDay', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_selectedDay');
  }

  void deleteSelectedDay() {
    secureStorage.delete(key: 'ff_selectedDay');
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

  int _specialialityIndex = 0;
  int get specialialityIndex => _specialialityIndex;
  set specialialityIndex(int value) {
    _specialialityIndex = value;
    secureStorage.setInt('ff_specialialityIndex', value);
  }

  void deleteSpecialialityIndex() {
    secureStorage.delete(key: 'ff_specialialityIndex');
  }

  List<String> _cleanHospital = [];
  List<String> get cleanHospital => _cleanHospital;
  set cleanHospital(List<String> value) {
    _cleanHospital = value;
    secureStorage.setStringList('ff_cleanHospital', value);
  }

  void deleteCleanHospital() {
    secureStorage.delete(key: 'ff_cleanHospital');
  }

  void addToCleanHospital(String value) {
    cleanHospital.add(value);
    secureStorage.setStringList('ff_cleanHospital', _cleanHospital);
  }

  void removeFromCleanHospital(String value) {
    cleanHospital.remove(value);
    secureStorage.setStringList('ff_cleanHospital', _cleanHospital);
  }

  void removeAtIndexFromCleanHospital(int index) {
    cleanHospital.removeAt(index);
    secureStorage.setStringList('ff_cleanHospital', _cleanHospital);
  }

  void updateCleanHospitalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cleanHospital[index] = updateFn(_cleanHospital[index]);
    secureStorage.setStringList('ff_cleanHospital', _cleanHospital);
  }

  void insertAtIndexInCleanHospital(int index, String value) {
    cleanHospital.insert(index, value);
    secureStorage.setStringList('ff_cleanHospital', _cleanHospital);
  }

  bool _CRMCheck = false;
  bool get CRMCheck => _CRMCheck;
  set CRMCheck(bool value) {
    _CRMCheck = value;
    secureStorage.setBool('ff_CRMCheck', value);
  }

  void deleteCRMCheck() {
    secureStorage.delete(key: 'ff_CRMCheck');
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

  final _especialidadesManager =
      StreamRequestManager<List<EspecialidadesRow>>();
  Stream<List<EspecialidadesRow>> especialidades({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EspecialidadesRow>> Function() requestFn,
  }) =>
      _especialidadesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEspecialidadesCache() => _especialidadesManager.clear();
  void clearEspecialidadesCacheKey(String? uniqueKey) =>
      _especialidadesManager.clearRequest(uniqueKey);

  final _estadosCadastroManager =
      StreamRequestManager<List<EstadosBrasilRow>>();
  Stream<List<EstadosBrasilRow>> estadosCadastro({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EstadosBrasilRow>> Function() requestFn,
  }) =>
      _estadosCadastroManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEstadosCadastroCache() => _estadosCadastroManager.clear();
  void clearEstadosCadastroCacheKey(String? uniqueKey) =>
      _estadosCadastroManager.clearRequest(uniqueKey);

  final _vagasAbertasManager =
      FutureRequestManager<List<VwVagasCandidaturasRow>>();
  Future<List<VwVagasCandidaturasRow>> vagasAbertas({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VwVagasCandidaturasRow>> Function() requestFn,
  }) =>
      _vagasAbertasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVagasAbertasCache() => _vagasAbertasManager.clear();
  void clearVagasAbertasCacheKey(String? uniqueKey) =>
      _vagasAbertasManager.clearRequest(uniqueKey);

  final _vagasAbertasInicialManager =
      FutureRequestManager<List<VwVagasAbertasRow>>();
  Future<List<VwVagasAbertasRow>> vagasAbertasInicial({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VwVagasAbertasRow>> Function() requestFn,
  }) =>
      _vagasAbertasInicialManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVagasAbertasInicialCache() => _vagasAbertasInicialManager.clear();
  void clearVagasAbertasInicialCacheKey(String? uniqueKey) =>
      _vagasAbertasInicialManager.clearRequest(uniqueKey);

  final _vagasMedicoManager =
      FutureRequestManager<List<VwVagasCandidaturasRow>>();
  Future<List<VwVagasCandidaturasRow>> vagasMedico({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VwVagasCandidaturasRow>> Function() requestFn,
  }) =>
      _vagasMedicoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVagasMedicoCache() => _vagasMedicoManager.clear();
  void clearVagasMedicoCacheKey(String? uniqueKey) =>
      _vagasMedicoManager.clearRequest(uniqueKey);

  final _vagasEscalaManager =
      FutureRequestManager<List<VwVagasCandidaturasRow>>();
  Future<List<VwVagasCandidaturasRow>> vagasEscala({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VwVagasCandidaturasRow>> Function() requestFn,
  }) =>
      _vagasEscalaManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVagasEscalaCache() => _vagasEscalaManager.clear();
  void clearVagasEscalaCacheKey(String? uniqueKey) =>
      _vagasEscalaManager.clearRequest(uniqueKey);

  final _userProfileManager = FutureRequestManager<List<UserProfileRow>>();
  Future<List<UserProfileRow>> userProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserProfileRow>> Function() requestFn,
  }) =>
      _userProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserProfileCache() => _userProfileManager.clear();
  void clearUserProfileCacheKey(String? uniqueKey) =>
      _userProfileManager.clearRequest(uniqueKey);

  final _vagasHistoricoManager =
      FutureRequestManager<List<VwVagasCandidaturasRow>>();
  Future<List<VwVagasCandidaturasRow>> vagasHistorico({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VwVagasCandidaturasRow>> Function() requestFn,
  }) =>
      _vagasHistoricoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVagasHistoricoCache() => _vagasHistoricoManager.clear();
  void clearVagasHistoricoCacheKey(String? uniqueKey) =>
      _vagasHistoricoManager.clearRequest(uniqueKey);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
