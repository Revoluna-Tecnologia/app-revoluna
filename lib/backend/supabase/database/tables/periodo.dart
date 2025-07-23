import '../database.dart';

class PeriodoTable extends SupabaseTable<PeriodoRow> {
  @override
  String get tableName => 'periodo';

  @override
  PeriodoRow createRow(Map<String, dynamic> data) => PeriodoRow(data);
}

class PeriodoRow extends SupabaseDataRow {
  PeriodoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PeriodoTable();

  String get periodoId => getField<String>('periodo_id')!;
  set periodoId(String value) => setField<String>('periodo_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get periodo => getField<String>('periodo');
  set periodo(String? value) => setField<String>('periodo', value);
}
