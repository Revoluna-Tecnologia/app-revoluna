import '../database.dart';

class GrupoTable extends SupabaseTable<GrupoRow> {
  @override
  String get tableName => 'grupo';

  @override
  GrupoRow createRow(Map<String, dynamic> data) => GrupoRow(data);
}

class GrupoRow extends SupabaseDataRow {
  GrupoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GrupoTable();

  String get grupoId => getField<String>('grupo_id')!;
  set grupoId(String value) => setField<String>('grupo_id', value);

  String get grupoNome => getField<String>('grupo_nome')!;
  set grupoNome(String value) => setField<String>('grupo_nome', value);

  String? get grupoResponsavel => getField<String>('grupo_responsavel');
  set grupoResponsavel(String? value) =>
      setField<String>('grupo_responsavel', value);

  String? get grupoTelefone => getField<String>('grupo_telefone');
  set grupoTelefone(String? value) => setField<String>('grupo_telefone', value);

  String? get grupoEmail => getField<String>('grupo_email');
  set grupoEmail(String? value) => setField<String>('grupo_email', value);

  DateTime get grupoCreatedate => getField<DateTime>('grupo_createdate')!;
  set grupoCreatedate(DateTime value) =>
      setField<DateTime>('grupo_createdate', value);
}
