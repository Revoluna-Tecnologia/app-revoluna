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

  String get especialidadeId => getField<String>('especialidade_id')!;
  set especialidadeId(String value) =>
      setField<String>('especialidade_id', value);

  DateTime? get especialidadeCreatedAt =>
      getField<DateTime>('especialidade_created_at');
  set especialidadeCreatedAt(DateTime? value) =>
      setField<DateTime>('especialidade_created_at', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);

  int? get especialidadeIndex => getField<int>('especialidade_index');
  set especialidadeIndex(int? value) =>
      setField<int>('especialidade_index', value);
}
