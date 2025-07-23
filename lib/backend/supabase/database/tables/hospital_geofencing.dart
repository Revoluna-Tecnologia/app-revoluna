import '../database.dart';

class HospitalGeofencingTable extends SupabaseTable<HospitalGeofencingRow> {
  @override
  String get tableName => 'hospital_geofencing';

  @override
  HospitalGeofencingRow createRow(Map<String, dynamic> data) =>
      HospitalGeofencingRow(data);
}

class HospitalGeofencingRow extends SupabaseDataRow {
  HospitalGeofencingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HospitalGeofencingTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get hospitalId => getField<String>('hospital_id');
  set hospitalId(String? value) => setField<String>('hospital_id', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  int? get raioMetros => getField<int>('raio_metros');
  set raioMetros(int? value) => setField<int>('raio_metros', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
