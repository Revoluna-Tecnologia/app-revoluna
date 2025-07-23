import '../database.dart';

class VwOcupacaoPlantoesTable extends SupabaseTable<VwOcupacaoPlantoesRow> {
  @override
  String get tableName => 'vw_ocupacao_plantoes';

  @override
  VwOcupacaoPlantoesRow createRow(Map<String, dynamic> data) =>
      VwOcupacaoPlantoesRow(data);
}

class VwOcupacaoPlantoesRow extends SupabaseDataRow {
  VwOcupacaoPlantoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwOcupacaoPlantoesTable();

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  int? get totalVagas => getField<int>('total_vagas');
  set totalVagas(int? value) => setField<int>('total_vagas', value);

  int? get vagasSemCandidatos => getField<int>('vagas_sem_candidatos');
  set vagasSemCandidatos(int? value) =>
      setField<int>('vagas_sem_candidatos', value);
}
