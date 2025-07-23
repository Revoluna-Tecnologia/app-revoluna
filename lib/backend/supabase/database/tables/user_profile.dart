import '../database.dart';

class UserProfileTable extends SupabaseTable<UserProfileRow> {
  @override
  String get tableName => 'user_profile';

  @override
  UserProfileRow createRow(Map<String, dynamic> data) => UserProfileRow(data);
}

class UserProfileRow extends SupabaseDataRow {
  UserProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserProfileTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get profilepicture => getField<String>('profilepicture');
  set profilepicture(String? value) =>
      setField<String>('profilepicture', value);

  String? get displayname => getField<String>('displayname');
  set displayname(String? value) => setField<String>('displayname', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  int get areacodeIndex => getField<int>('areacodeIndex')!;
  set areacodeIndex(int value) => setField<int>('areacodeIndex', value);

  int get uFindex => getField<int>('UFindex')!;
  set uFindex(int value) => setField<int>('UFindex', value);

  int get specialtyIndex => getField<int>('specialtyIndex')!;
  set specialtyIndex(int value) => setField<int>('specialtyIndex', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  String? get platform => getField<String>('platform');
  set platform(String? value) => setField<String>('platform', value);

  String? get apnToken => getField<String>('apn_token');
  set apnToken(String? value) => setField<String>('apn_token', value);
}
