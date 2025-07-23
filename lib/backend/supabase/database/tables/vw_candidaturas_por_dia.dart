import '../database.dart';

class VwCandidaturasPorDiaTable extends SupabaseTable<VwCandidaturasPorDiaRow> {
  @override
  String get tableName => 'vw_candidaturas_por_dia';

  @override
  VwCandidaturasPorDiaRow createRow(Map<String, dynamic> data) =>
      VwCandidaturasPorDiaRow(data);
}

class VwCandidaturasPorDiaRow extends SupabaseDataRow {
  VwCandidaturasPorDiaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwCandidaturasPorDiaTable();

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
