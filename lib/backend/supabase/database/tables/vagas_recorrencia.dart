import '../database.dart';

class VagasRecorrenciaTable extends SupabaseTable<VagasRecorrenciaRow> {
  @override
  String get tableName => 'vagas_recorrencia';

  @override
  VagasRecorrenciaRow createRow(Map<String, dynamic> data) =>
      VagasRecorrenciaRow(data);
}

class VagasRecorrenciaRow extends SupabaseDataRow {
  VagasRecorrenciaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasRecorrenciaTable();

  String get recorrenciaId => getField<String>('recorrencia_id')!;
  set recorrenciaId(String value) => setField<String>('recorrencia_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime get dataInicio => getField<DateTime>('data_inicio')!;
  set dataInicio(DateTime value) => setField<DateTime>('data_inicio', value);

  DateTime get dataFim => getField<DateTime>('data_fim')!;
  set dataFim(DateTime value) => setField<DateTime>('data_fim', value);

  List<int> get diasSemana => getListField<int>('dias_semana')!;
  set diasSemana(List<int> value) => setListField<int>('dias_semana', value);

  String? get observacoes => getField<String>('observacoes');
  set observacoes(String? value) => setField<String>('observacoes', value);
}
