import '../database.dart';

class EscalistaExternoTable extends SupabaseTable<EscalistaExternoRow> {
  @override
  String get tableName => 'escalista_externo';

  @override
  EscalistaExternoRow createRow(Map<String, dynamic> data) =>
      EscalistaExternoRow(data);
}

class EscalistaExternoRow extends SupabaseDataRow {
  EscalistaExternoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EscalistaExternoTable();

  String get escalistaId => getField<String>('escalista_id')!;
  set escalistaId(String value) => setField<String>('escalista_id', value);

  String get escalistaNome => getField<String>('escalista_nome')!;
  set escalistaNome(String value) => setField<String>('escalista_nome', value);

  String get escalistaTelefone => getField<String>('escalista_telefone')!;
  set escalistaTelefone(String value) =>
      setField<String>('escalista_telefone', value);

  String get escalistaEmail => getField<String>('escalista_email')!;
  set escalistaEmail(String value) =>
      setField<String>('escalista_email', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  DateTime get escalistaCreatedate =>
      getField<DateTime>('escalista_createdate')!;
  set escalistaCreatedate(DateTime value) =>
      setField<DateTime>('escalista_createdate', value);

  DateTime get escalistaUpdateat => getField<DateTime>('escalista_updateat')!;
  set escalistaUpdateat(DateTime value) =>
      setField<DateTime>('escalista_updateat', value);

  String? get escalistaUpdateby => getField<String>('escalista_updateby');
  set escalistaUpdateby(String? value) =>
      setField<String>('escalista_updateby', value);
}
