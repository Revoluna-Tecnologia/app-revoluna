import 'package:flutter/material.dart';
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
      _valuesPrivacy = prefs.getBool('ff_valuesPrivacy') ?? _valuesPrivacy;
    });
    _safeInit(() {
      _concierge = prefs.getString('ff_concierge') ?? _concierge;
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

  LatLng? _location = LatLng(-23.5557714, -46.6395571);
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
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

  String _profilepicture =
      'https://hxgbaruenomkfeeafmff.supabase.co/storage/v1/object/public/profilepictures//Avatar.png';
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

  bool _valuesPrivacy = false;
  bool get valuesPrivacy => _valuesPrivacy;
  set valuesPrivacy(bool value) {
    _valuesPrivacy = value;
    prefs.setBool('ff_valuesPrivacy', value);
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  String _concierge = '5511969193194';
  String get concierge => _concierge;
  set concierge(String value) {
    _concierge = value;
    prefs.setString('ff_concierge', value);
  }

  List<String> _appleData = [];
  List<String> get appleData => _appleData;
  set appleData(List<String> value) {
    _appleData = value;
  }

  void addToAppleData(String value) {
    appleData.add(value);
  }

  void removeFromAppleData(String value) {
    appleData.remove(value);
  }

  void removeAtIndexFromAppleData(int index) {
    appleData.removeAt(index);
  }

  void updateAppleDataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    appleData[index] = updateFn(_appleData[index]);
  }

  void insertAtIndexInAppleData(int index, String value) {
    appleData.insert(index, value);
  }
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
