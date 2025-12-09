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

  String? get vagaId => getField<String>('vaga_id');
  set vagaId(String? value) => setField<String>('vaga_id', value);

  DateTime? get vagaData => getField<DateTime>('vaga_data');
  set vagaData(DateTime? value) => setField<DateTime>('vaga_data', value);

  DateTime? get vagaCreatedate => getField<DateTime>('vaga_createdate');
  set vagaCreatedate(DateTime? value) =>
      setField<DateTime>('vaga_createdate', value);

  String? get vagaStatus => getField<String>('vaga_status');
  set vagaStatus(String? value) => setField<String>('vaga_status', value);

  int? get vagaValor => getField<int>('vaga_valor');
  set vagaValor(int? value) => setField<int>('vaga_valor', value);

  PostgresTime? get vagaHorainicio => getField<PostgresTime>('vaga_horainicio');
  set vagaHorainicio(PostgresTime? value) =>
      setField<PostgresTime>('vaga_horainicio', value);

  PostgresTime? get vagaHorafim => getField<PostgresTime>('vaga_horafim');
  set vagaHorafim(PostgresTime? value) =>
      setField<PostgresTime>('vaga_horafim', value);

  DateTime? get vagaDatapagamento => getField<DateTime>('vaga_datapagamento');
  set vagaDatapagamento(DateTime? value) =>
      setField<DateTime>('vaga_datapagamento', value);

  String? get periodoId => getField<String>('periodo_id');
  set periodoId(String? value) => setField<String>('periodo_id', value);

  String? get periodoNome => getField<String>('periodo_nome');
  set periodoNome(String? value) => setField<String>('periodo_nome', value);

  String? get tiposVagaId => getField<String>('tipos_vaga_id');
  set tiposVagaId(String? value) => setField<String>('tipos_vaga_id', value);

  String? get tiposVagaNome => getField<String>('tipos_vaga_nome');
  set tiposVagaNome(String? value) =>
      setField<String>('tipos_vaga_nome', value);

  String? get formaRecebimentoId => getField<String>('forma_recebimento_id');
  set formaRecebimentoId(String? value) =>
      setField<String>('forma_recebimento_id', value);

  String? get formaRecebimentoNome =>
      getField<String>('forma_recebimento_nome');
  set formaRecebimentoNome(String? value) =>
      setField<String>('forma_recebimento_nome', value);

  String? get vagaObservacoes => getField<String>('vaga_observacoes');
  set vagaObservacoes(String? value) =>
      setField<String>('vaga_observacoes', value);

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

  String? get candidaturaId => getField<String>('candidatura_id');
  set candidaturaId(String? value) => setField<String>('candidatura_id', value);

  int? get totalCandidaturas => getField<int>('total_candidaturas');
  set totalCandidaturas(int? value) =>
      setField<int>('total_candidaturas', value);

  String? get candidaturaStatus => getField<String>('candidatura_status');
  set candidaturaStatus(String? value) =>
      setField<String>('candidatura_status', value);

  DateTime? get candidaturaCreatedate =>
      getField<DateTime>('candidatura_createdate');
  set candidaturaCreatedate(DateTime? value) =>
      setField<DateTime>('candidatura_createdate', value);

  String? get candidaturaUpdateby => getField<String>('candidatura_updateby');
  set candidaturaUpdateby(String? value) =>
      setField<String>('candidatura_updateby', value);

  DateTime? get candidaturaUpdatedat =>
      getField<DateTime>('candidatura_updatedat');
  set candidaturaUpdatedat(DateTime? value) =>
      setField<DateTime>('candidatura_updatedat', value);

  String? get medicoId => getField<String>('medico_id');
  set medicoId(String? value) => setField<String>('medico_id', value);

  String? get medicoPrimeiroNome => getField<String>('medico_primeiro_nome');
  set medicoPrimeiroNome(String? value) =>
      setField<String>('medico_primeiro_nome', value);

  String? get medicoSobrenome => getField<String>('medico_sobrenome');
  set medicoSobrenome(String? value) =>
      setField<String>('medico_sobrenome', value);

  String? get medicoCrm => getField<String>('medico_crm');
  set medicoCrm(String? value) => setField<String>('medico_crm', value);

  String? get medicoCpf => getField<String>('medico_cpf');
  set medicoCpf(String? value) => setField<String>('medico_cpf', value);

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
