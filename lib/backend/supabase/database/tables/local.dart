import '../database.dart';

class LocalTable extends SupabaseTable<LocalRow> {
  @override
  String get tableName => 'local';

  @override
  LocalRow createRow(Map<String, dynamic> data) => LocalRow(data);
}

class LocalRow extends SupabaseDataRow {
  LocalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocalTable();

  String get localId => getField<String>('local_id')!;
  set localId(String value) => setField<String>('local_id', value);

  String get localNome => getField<String>('local_nome')!;
  set localNome(String value) => setField<String>('local_nome', value);
}
