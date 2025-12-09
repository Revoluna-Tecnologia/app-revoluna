import '../database.dart';

class EspecialidadesTable extends SupabaseTable<EspecialidadesRow> {
  @override
  String get tableName => 'especialidades';

  @override
  EspecialidadesRow createRow(Map<String, dynamic> data) =>
      EspecialidadesRow(data);
}

class EspecialidadesRow extends SupabaseDataRow {
  EspecialidadesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EspecialidadesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int? get index => getField<int>('index');
  set index(int? value) => setField<int>('index', value);
}
