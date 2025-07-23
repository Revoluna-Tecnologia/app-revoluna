import '../database.dart';

class VwUsuariosPorDiaTable extends SupabaseTable<VwUsuariosPorDiaRow> {
  @override
  String get tableName => 'vw_usuarios_por_dia';

  @override
  VwUsuariosPorDiaRow createRow(Map<String, dynamic> data) =>
      VwUsuariosPorDiaRow(data);
}

class VwUsuariosPorDiaRow extends SupabaseDataRow {
  VwUsuariosPorDiaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwUsuariosPorDiaTable();

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
