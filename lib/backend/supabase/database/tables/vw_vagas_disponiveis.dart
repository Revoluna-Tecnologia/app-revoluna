import '../database.dart';

class VwVagasDisponiveisTable extends SupabaseTable<VwVagasDisponiveisRow> {
  @override
  String get tableName => 'vw_vagas_disponiveis';

  @override
  VwVagasDisponiveisRow createRow(Map<String, dynamic> data) =>
      VwVagasDisponiveisRow(data);
}

class VwVagasDisponiveisRow extends SupabaseDataRow {
  VwVagasDisponiveisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwVagasDisponiveisTable();

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  DateTime? get vagasData => getField<DateTime>('vagas_data');
  set vagasData(DateTime? value) => setField<DateTime>('vagas_data', value);

  PostgresTime? get vagasHorainicio =>
      getField<PostgresTime>('vagas_horainicio');
  set vagasHorainicio(PostgresTime? value) =>
      setField<PostgresTime>('vagas_horainicio', value);

  PostgresTime? get vagasHorafim => getField<PostgresTime>('vagas_horafim');
  set vagasHorafim(PostgresTime? value) =>
      setField<PostgresTime>('vagas_horafim', value);

  int? get vagasValor => getField<int>('vagas_valor');
  set vagasValor(int? value) => setField<int>('vagas_valor', value);

  String? get hospitalNome => getField<String>('hospital_nome');
  set hospitalNome(String? value) => setField<String>('hospital_nome', value);

  String? get hospitalCidade => getField<String>('hospital_cidade');
  set hospitalCidade(String? value) =>
      setField<String>('hospital_cidade', value);

  String? get hospitalEstado => getField<String>('hospital_estado');
  set hospitalEstado(String? value) =>
      setField<String>('hospital_estado', value);

  String? get setorNome => getField<String>('setor_nome');
  set setorNome(String? value) => setField<String>('setor_nome', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);

  String? get periodo => getField<String>('periodo');
  set periodo(String? value) => setField<String>('periodo', value);

  int? get vagasTotalcandidaturas => getField<int>('vagas_totalcandidaturas');
  set vagasTotalcandidaturas(int? value) =>
      setField<int>('vagas_totalcandidaturas', value);

  String? get vagasStatus => getField<String>('vagas_status');
  set vagasStatus(String? value) => setField<String>('vagas_status', value);
}
