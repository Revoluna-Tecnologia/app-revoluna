import '../database.dart';

class VwDashboardMetricsTable extends SupabaseTable<VwDashboardMetricsRow> {
  @override
  String get tableName => 'vw_dashboard_metrics';

  @override
  VwDashboardMetricsRow createRow(Map<String, dynamic> data) =>
      VwDashboardMetricsRow(data);
}

class VwDashboardMetricsRow extends SupabaseDataRow {
  VwDashboardMetricsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwDashboardMetricsTable();

  int? get totalVagasAtivas => getField<int>('total_vagas_ativas');
  set totalVagasAtivas(int? value) =>
      setField<int>('total_vagas_ativas', value);

  int? get vagasUltimoMes => getField<int>('vagas_ultimo_mes');
  set vagasUltimoMes(int? value) => setField<int>('vagas_ultimo_mes', value);

  int? get totalCandidaturasPendentes =>
      getField<int>('total_candidaturas_pendentes');
  set totalCandidaturasPendentes(int? value) =>
      setField<int>('total_candidaturas_pendentes', value);

  int? get candidaturasUltimoDia => getField<int>('candidaturas_ultimo_dia');
  set candidaturasUltimoDia(int? value) =>
      setField<int>('candidaturas_ultimo_dia', value);

  int? get totalDocumentosPendentes =>
      getField<int>('total_documentos_pendentes');
  set totalDocumentosPendentes(int? value) =>
      setField<int>('total_documentos_pendentes', value);

  int? get documentosUltimoDia => getField<int>('documentos_ultimo_dia');
  set documentosUltimoDia(int? value) =>
      setField<int>('documentos_ultimo_dia', value);

  DateTime? get ultimaAtualizacao => getField<DateTime>('ultima_atualizacao');
  set ultimaAtualizacao(DateTime? value) =>
      setField<DateTime>('ultima_atualizacao', value);
}
