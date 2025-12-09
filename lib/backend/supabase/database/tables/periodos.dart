import '../database.dart';

class PeriodosTable extends SupabaseTable<PeriodosRow> {
  @override
  String get tableName => 'periodos';

  @override
  PeriodosRow createRow(Map<String, dynamic> data) => PeriodosRow(data);
}

class PeriodosRow extends SupabaseDataRow {
  PeriodosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PeriodosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
