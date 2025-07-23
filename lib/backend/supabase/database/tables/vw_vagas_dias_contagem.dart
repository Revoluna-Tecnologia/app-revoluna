import '../database.dart';

class VwVagasDiasContagemTable extends SupabaseTable<VwVagasDiasContagemRow> {
  @override
  String get tableName => 'vw_vagas_dias_contagem';

  @override
  VwVagasDiasContagemRow createRow(Map<String, dynamic> data) =>
      VwVagasDiasContagemRow(data);
}

class VwVagasDiasContagemRow extends SupabaseDataRow {
  VwVagasDiasContagemRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwVagasDiasContagemTable();

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  int? get diasDesdeCriacao => getField<int>('dias_desde_criacao');
  set diasDesdeCriacao(int? value) =>
      setField<int>('dias_desde_criacao', value);

  int? get diasAteVaga => getField<int>('dias_ate_vaga');
  set diasAteVaga(int? value) => setField<int>('dias_ate_vaga', value);
}
