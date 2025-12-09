import '../database.dart';

class GruposTable extends SupabaseTable<GruposRow> {
  @override
  String get tableName => 'grupos';

  @override
  GruposRow createRow(Map<String, dynamic> data) => GruposRow(data);
}

class GruposRow extends SupabaseDataRow {
  GruposRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GruposTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String? get responsavel => getField<String>('responsavel');
  set responsavel(String? value) => setField<String>('responsavel', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
