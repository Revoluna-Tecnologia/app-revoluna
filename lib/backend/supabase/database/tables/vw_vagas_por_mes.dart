import '../database.dart';

class VwVagasPorMesTable extends SupabaseTable<VwVagasPorMesRow> {
  @override
  String get tableName => 'vw_vagas_por_mes';

  @override
  VwVagasPorMesRow createRow(Map<String, dynamic> data) =>
      VwVagasPorMesRow(data);
}

class VwVagasPorMesRow extends SupabaseDataRow {
  VwVagasPorMesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwVagasPorMesTable();

  DateTime? get mes => getField<DateTime>('mes');
  set mes(DateTime? value) => setField<DateTime>('mes', value);

  int? get totalVagas => getField<int>('total_vagas');
  set totalVagas(int? value) => setField<int>('total_vagas', value);
}
