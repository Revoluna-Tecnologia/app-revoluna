import '../database.dart';

class VwVagasAbertasTable extends SupabaseTable<VwVagasAbertasRow> {
  @override
  String get tableName => 'vw_vagas_abertas';

  @override
  VwVagasAbertasRow createRow(Map<String, dynamic> data) =>
      VwVagasAbertasRow(data);
}

class VwVagasAbertasRow extends SupabaseDataRow {
  VwVagasAbertasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwVagasAbertasTable();

  int? get idx => getField<int>('idx');
  set idx(int? value) => setField<int>('idx', value);

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  DateTime? get vagasData => getField<DateTime>('vagas_data');
  set vagasData(DateTime? value) => setField<DateTime>('vagas_data', value);

  DateTime? get vagasCreatedate => getField<DateTime>('vagas_createdate');
  set vagasCreatedate(DateTime? value) =>
      setField<DateTime>('vagas_createdate', value);

  String? get vagasStatus => getField<String>('vagas_status');
  set vagasStatus(String? value) => setField<String>('vagas_status', value);

  int? get vagasValor => getField<int>('vagas_valor');
  set vagasValor(int? value) => setField<int>('vagas_valor', value);

  PostgresTime? get vagasHorainicio =>
      getField<PostgresTime>('vagas_horainicio');
  set vagasHorainicio(PostgresTime? value) =>
      setField<PostgresTime>('vagas_horainicio', value);

  PostgresTime? get vagasHorafim => getField<PostgresTime>('vagas_horafim');
  set vagasHorafim(PostgresTime? value) =>
      setField<PostgresTime>('vagas_horafim', value);

  DateTime? get vagasDatapagamento => getField<DateTime>('vagas_datapagamento');
  set vagasDatapagamento(DateTime? value) =>
      setField<DateTime>('vagas_datapagamento', value);

  String? get vagasPeriodo => getField<String>('vagas_periodo');
  set vagasPeriodo(String? value) => setField<String>('vagas_periodo', value);

  String? get vagasPeriodoNome => getField<String>('vagas_periodo_nome');
  set vagasPeriodoNome(String? value) =>
      setField<String>('vagas_periodo_nome', value);

  String? get vagasTipo => getField<String>('vagas_tipo');
  set vagasTipo(String? value) => setField<String>('vagas_tipo', value);

  String? get vagasTipoNome => getField<String>('vagas_tipo_nome');
  set vagasTipoNome(String? value) =>
      setField<String>('vagas_tipo_nome', value);

  String? get vagasFormarecebimento =>
      getField<String>('vagas_formarecebimento');
  set vagasFormarecebimento(String? value) =>
      setField<String>('vagas_formarecebimento', value);

  String? get vagasFormarecebimentoNome =>
      getField<String>('vagas_formarecebimento_nome');
  set vagasFormarecebimentoNome(String? value) =>
      setField<String>('vagas_formarecebimento_nome', value);

  String? get vagasObservacoes => getField<String>('vagas_observacoes');
  set vagasObservacoes(String? value) =>
      setField<String>('vagas_observacoes', value);

  String? get hospitalId => getField<String>('hospital_id');
  set hospitalId(String? value) => setField<String>('hospital_id', value);

  String? get hospitalNome => getField<String>('hospital_nome');
  set hospitalNome(String? value) => setField<String>('hospital_nome', value);

  String? get hospitalEstado => getField<String>('hospital_estado');
  set hospitalEstado(String? value) =>
      setField<String>('hospital_estado', value);

  double? get hospitalLat => getField<double>('hospital_lat');
  set hospitalLat(double? value) => setField<double>('hospital_lat', value);

  double? get hospitalLog => getField<double>('hospital_log');
  set hospitalLog(double? value) => setField<double>('hospital_log', value);

  String? get hospitalEnd => getField<String>('hospital_end');
  set hospitalEnd(String? value) => setField<String>('hospital_end', value);

  String? get hospitalAvatar => getField<String>('hospital_avatar');
  set hospitalAvatar(String? value) =>
      setField<String>('hospital_avatar', value);

  String? get especialidadeId => getField<String>('especialidade_id');
  set especialidadeId(String? value) =>
      setField<String>('especialidade_id', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);

  String? get setorId => getField<String>('setor_id');
  set setorId(String? value) => setField<String>('setor_id', value);

  String? get setorNome => getField<String>('setor_nome');
  set setorNome(String? value) => setField<String>('setor_nome', value);

  String? get escalistaId => getField<String>('escalista_id');
  set escalistaId(String? value) => setField<String>('escalista_id', value);

  String? get escalistaNome => getField<String>('escalista_nome');
  set escalistaNome(String? value) => setField<String>('escalista_nome', value);

  String? get escalistaEmail => getField<String>('escalista_email');
  set escalistaEmail(String? value) =>
      setField<String>('escalista_email', value);

  String? get escalistaTelefone => getField<String>('escalista_telefone');
  set escalistaTelefone(String? value) =>
      setField<String>('escalista_telefone', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  String? get grupoNome => getField<String>('grupo_nome');
  set grupoNome(String? value) => setField<String>('grupo_nome', value);
}
