import '../database.dart';

class TipovagaTable extends SupabaseTable<TipovagaRow> {
  @override
  String get tableName => 'tipovaga';

  @override
  TipovagaRow createRow(Map<String, dynamic> data) => TipovagaRow(data);
}

class TipovagaRow extends SupabaseDataRow {
  TipovagaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TipovagaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);
}
