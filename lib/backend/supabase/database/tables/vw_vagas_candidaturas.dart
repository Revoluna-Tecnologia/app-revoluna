import '../database.dart';

class VwVagasCandidaturasTable extends SupabaseTable<VwVagasCandidaturasRow> {
  @override
  String get tableName => 'vw_vagas_candidaturas';

  @override
  VwVagasCandidaturasRow createRow(Map<String, dynamic> data) =>
      VwVagasCandidaturasRow(data);
}

class VwVagasCandidaturasRow extends SupabaseDataRow {
  VwVagasCandidaturasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwVagasCandidaturasTable();

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

  String? get candidaturasId => getField<String>('candidaturas_id');
  set candidaturasId(String? value) =>
      setField<String>('candidaturas_id', value);

  int? get totalCandidaturas => getField<int>('total_candidaturas');
  set totalCandidaturas(int? value) =>
      setField<int>('total_candidaturas', value);

  String? get candidaturaStatus => getField<String>('candidatura_status');
  set candidaturaStatus(String? value) =>
      setField<String>('candidatura_status', value);

  DateTime? get candidatosCreatedate =>
      getField<DateTime>('candidatos_createdate');
  set candidatosCreatedate(DateTime? value) =>
      setField<DateTime>('candidatos_createdate', value);

  String? get candidaturasUpdateby => getField<String>('candidaturas_updateby');
  set candidaturasUpdateby(String? value) =>
      setField<String>('candidaturas_updateby', value);

  DateTime? get candidaturasUpdateat =>
      getField<DateTime>('candidaturas_updateat');
  set candidaturasUpdateat(DateTime? value) =>
      setField<DateTime>('candidaturas_updateat', value);

  String? get medicoId => getField<String>('medico_id');
  set medicoId(String? value) => setField<String>('medico_id', value);

  String? get medicoPrimeironome => getField<String>('medico_primeironome');
  set medicoPrimeironome(String? value) =>
      setField<String>('medico_primeironome', value);

  String? get medicoSobrenome => getField<String>('medico_sobrenome');
  set medicoSobrenome(String? value) =>
      setField<String>('medico_sobrenome', value);

  String? get medicoCrm => getField<String>('medico_crm');
  set medicoCrm(String? value) => setField<String>('medico_crm', value);

  String? get medicoEstado => getField<String>('medico_estado');
  set medicoEstado(String? value) => setField<String>('medico_estado', value);

  String? get medicoEmail => getField<String>('medico_email');
  set medicoEmail(String? value) => setField<String>('medico_email', value);

  String? get medicoTelefone => getField<String>('medico_telefone');
  set medicoTelefone(String? value) =>
      setField<String>('medico_telefone', value);

  String? get medicoPrecadastroId => getField<String>('medico_precadastro_id');
  set medicoPrecadastroId(String? value) =>
      setField<String>('medico_precadastro_id', value);

  String? get recorrenciaId => getField<String>('recorrencia_id');
  set recorrenciaId(String? value) => setField<String>('recorrencia_id', value);

  bool? get vagaSalva => getField<bool>('vaga_salva');
  set vagaSalva(bool? value) => setField<bool>('vaga_salva', value);

  bool? get medicoFavorito => getField<bool>('medico_favorito');
  set medicoFavorito(bool? value) => setField<bool>('medico_favorito', value);

  DateTime? get checkin => getField<DateTime>('checkin');
  set checkin(DateTime? value) => setField<DateTime>('checkin', value);

  DateTime? get checkout => getField<DateTime>('checkout');
  set checkout(DateTime? value) => setField<DateTime>('checkout', value);

  int? get pagamentoValor => getField<int>('pagamento_valor');
  set pagamentoValor(int? value) => setField<int>('pagamento_valor', value);

  String? get gradeId => getField<String>('grade_id');
  set gradeId(String? value) => setField<String>('grade_id', value);

  String? get gradeNome => getField<String>('grade_nome');
  set gradeNome(String? value) => setField<String>('grade_nome', value);

  String? get gradeCor => getField<String>('grade_cor');
  set gradeCor(String? value) => setField<String>('grade_cor', value);
}
