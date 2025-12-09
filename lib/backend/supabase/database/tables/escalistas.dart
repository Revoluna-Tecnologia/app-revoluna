import '../database.dart';

class EscalistasTable extends SupabaseTable<EscalistasRow> {
  @override
  String get tableName => 'escalistas';

  @override
  EscalistasRow createRow(Map<String, dynamic> data) => EscalistasRow(data);
}

class EscalistasRow extends SupabaseDataRow {
  EscalistasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EscalistasTable();

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get telefone => getField<String>('telefone')!;
  set telefone(String value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updateAt => getField<DateTime>('update_at')!;
  set updateAt(DateTime value) => setField<DateTime>('update_at', value);

  String? get updateBy => getField<String>('update_by');
  set updateBy(String? value) => setField<String>('update_by', value);

  String get escalistaStatus => getField<String>('escalista_status')!;
  set escalistaStatus(String value) =>
      setField<String>('escalista_status', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
