import '../database.dart';

class VagasHomeTable extends SupabaseTable<VagasHomeRow> {
  @override
  String get tableName => 'vagas_home';

  @override
  VagasHomeRow createRow(Map<String, dynamic> data) => VagasHomeRow(data);
}

class VagasHomeRow extends SupabaseDataRow {
  VagasHomeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasHomeTable();

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  DateTime? get vagasCreatedate => getField<DateTime>('vagas_createdate');
  set vagasCreatedate(DateTime? value) =>
      setField<DateTime>('vagas_createdate', value);

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

  DateTime? get vagasDatapagamento => getField<DateTime>('vagas_datapagamento');
  set vagasDatapagamento(DateTime? value) =>
      setField<DateTime>('vagas_datapagamento', value);

  String? get vagasFormarecebimento =>
      getField<String>('vagas_formarecebimento');
  set vagasFormarecebimento(String? value) =>
      setField<String>('vagas_formarecebimento', value);

  String? get vagasObservacoes => getField<String>('vagas_observacoes');
  set vagasObservacoes(String? value) =>
      setField<String>('vagas_observacoes', value);

  String? get hospitalNome => getField<String>('hospital_nome');
  set hospitalNome(String? value) => setField<String>('hospital_nome', value);

  String? get setorNome => getField<String>('setor_nome');
  set setorNome(String? value) => setField<String>('setor_nome', value);

  String? get periodoNome => getField<String>('periodo_nome');
  set periodoNome(String? value) => setField<String>('periodo_nome', value);

  String? get tipoNome => getField<String>('tipo_nome');
  set tipoNome(String? value) => setField<String>('tipo_nome', value);

  String? get escalistaNome => getField<String>('escalista_nome');
  set escalistaNome(String? value) => setField<String>('escalista_nome', value);

  String? get escalistaId => getField<String>('escalista_id');
  set escalistaId(String? value) => setField<String>('escalista_id', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  String? get grupoNome => getField<String>('grupo_nome');
  set grupoNome(String? value) => setField<String>('grupo_nome', value);

  String? get grupoResponsavel => getField<String>('grupo_responsavel');
  set grupoResponsavel(String? value) =>
      setField<String>('grupo_responsavel', value);

  String? get grupoTelefone => getField<String>('grupo_telefone');
  set grupoTelefone(String? value) => setField<String>('grupo_telefone', value);

  String? get grupoEmail => getField<String>('grupo_email');
  set grupoEmail(String? value) => setField<String>('grupo_email', value);

  String? get vagasStatus => getField<String>('vagas_status');
  set vagasStatus(String? value) => setField<String>('vagas_status', value);

  String? get escalistaTelefone => getField<String>('escalista_telefone');
  set escalistaTelefone(String? value) =>
      setField<String>('escalista_telefone', value);

  String? get escalistaEmail => getField<String>('escalista_email');
  set escalistaEmail(String? value) =>
      setField<String>('escalista_email', value);
}
