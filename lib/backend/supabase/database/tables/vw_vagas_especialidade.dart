import '../database.dart';

class VwVagasEspecialidadeTable extends SupabaseTable<VwVagasEspecialidadeRow> {
  @override
  String get tableName => 'vw_vagas_especialidade';

  @override
  VwVagasEspecialidadeRow createRow(Map<String, dynamic> data) =>
      VwVagasEspecialidadeRow(data);
}

class VwVagasEspecialidadeRow extends SupabaseDataRow {
  VwVagasEspecialidadeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwVagasEspecialidadeTable();

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  String? get vagaEspecialidade => getField<String>('vaga_especialidade');
  set vagaEspecialidade(String? value) =>
      setField<String>('vaga_especialidade', value);

  String? get especialidadeId => getField<String>('especialidade_id');
  set especialidadeId(String? value) =>
      setField<String>('especialidade_id', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);
}
