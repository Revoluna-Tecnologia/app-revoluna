import '../database.dart';

class CleanHospitalTable extends SupabaseTable<CleanHospitalRow> {
  @override
  String get tableName => 'clean_hospital';

  @override
  CleanHospitalRow createRow(Map<String, dynamic> data) =>
      CleanHospitalRow(data);
}

class CleanHospitalRow extends SupabaseDataRow {
  CleanHospitalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CleanHospitalTable();

  String? get terms => getField<String>('terms');
  set terms(String? value) => setField<String>('terms', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
