import '../database.dart';

class TiposVagaTable extends SupabaseTable<TiposVagaRow> {
  @override
  String get tableName => 'tipos_vaga';

  @override
  TiposVagaRow createRow(Map<String, dynamic> data) => TiposVagaRow(data);
}

class TiposVagaRow extends SupabaseDataRow {
  TiposVagaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TiposVagaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
