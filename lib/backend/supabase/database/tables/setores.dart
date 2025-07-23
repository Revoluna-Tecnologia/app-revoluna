import '../database.dart';

class SetoresTable extends SupabaseTable<SetoresRow> {
  @override
  String get tableName => 'setores';

  @override
  SetoresRow createRow(Map<String, dynamic> data) => SetoresRow(data);
}

class SetoresRow extends SupabaseDataRow {
  SetoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SetoresTable();

  String get setorId => getField<String>('setor_id')!;
  set setorId(String value) => setField<String>('setor_id', value);

  String get setorNome => getField<String>('setor_nome')!;
  set setorNome(String value) => setField<String>('setor_nome', value);
}
