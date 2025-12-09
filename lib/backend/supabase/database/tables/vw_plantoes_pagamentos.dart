import '../database.dart';

class VwPlantoesPagamentosTable extends SupabaseTable<VwPlantoesPagamentosRow> {
  @override
  String get tableName => 'vw_plantoes_pagamentos';

  @override
  VwPlantoesPagamentosRow createRow(Map<String, dynamic> data) =>
      VwPlantoesPagamentosRow(data);
}

class VwPlantoesPagamentosRow extends SupabaseDataRow {
  VwPlantoesPagamentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwPlantoesPagamentosTable();

  int? get idx => getField<int>('idx');
  set idx(int? value) => setField<int>('idx', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get candidaturaId => getField<String>('candidatura_id');
  set candidaturaId(String? value) => setField<String>('candidatura_id', value);

  String? get vagaId => getField<String>('vaga_id');
  set vagaId(String? value) => setField<String>('vaga_id', value);

  String? get medicoId => getField<String>('medico_id');
  set medicoId(String? value) => setField<String>('medico_id', value);

  String? get hospitalId => getField<String>('hospital_id');
  set hospitalId(String? value) => setField<String>('hospital_id', value);

  String? get setorId => getField<String>('setor_id');
  set setorId(String? value) => setField<String>('setor_id', value);

  String? get especialidadeId => getField<String>('especialidade_id');
  set especialidadeId(String? value) =>
      setField<String>('especialidade_id', value);

  String? get escalistaId => getField<String>('escalista_id');
  set escalistaId(String? value) => setField<String>('escalista_id', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  DateTime? get vagaData => getField<DateTime>('vaga_data');
  set vagaData(DateTime? value) => setField<DateTime>('vaga_data', value);

  PostgresTime? get vagaHorainicio => getField<PostgresTime>('vaga_horainicio');
  set vagaHorainicio(PostgresTime? value) =>
      setField<PostgresTime>('vaga_horainicio', value);

  PostgresTime? get vagaHorafim => getField<PostgresTime>('vaga_horafim');
  set vagaHorafim(PostgresTime? value) =>
      setField<PostgresTime>('vaga_horafim', value);

  int? get vagaValor => getField<int>('vaga_valor');
  set vagaValor(int? value) => setField<int>('vaga_valor', value);

  String? get vagaStatus => getField<String>('vaga_status');
  set vagaStatus(String? value) => setField<String>('vaga_status', value);

  String? get hospitalNome => getField<String>('hospital_nome');
  set hospitalNome(String? value) => setField<String>('hospital_nome', value);

  String? get setorNome => getField<String>('setor_nome');
  set setorNome(String? value) => setField<String>('setor_nome', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);

  String? get escalistaNome => getField<String>('escalista_nome');
  set escalistaNome(String? value) => setField<String>('escalista_nome', value);

  String? get medicoPrimeiroNome => getField<String>('medico_primeiro_nome');
  set medicoPrimeiroNome(String? value) =>
      setField<String>('medico_primeiro_nome', value);

  String? get medicoSobrenome => getField<String>('medico_sobrenome');
  set medicoSobrenome(String? value) =>
      setField<String>('medico_sobrenome', value);

  String? get medicoNome => getField<String>('medico_nome');
  set medicoNome(String? value) => setField<String>('medico_nome', value);

  String? get medicoCpf => getField<String>('medico_cpf');
  set medicoCpf(String? value) => setField<String>('medico_cpf', value);

  String? get medicoCrm => getField<String>('medico_crm');
  set medicoCrm(String? value) => setField<String>('medico_crm', value);

  int? get checkinId => getField<int>('checkin_id');
  set checkinId(int? value) => setField<int>('checkin_id', value);

  DateTime? get checkinHora => getField<DateTime>('checkin_hora');
  set checkinHora(DateTime? value) => setField<DateTime>('checkin_hora', value);

  String? get checkinStatus => getField<String>('checkin_status');
  set checkinStatus(String? value) => setField<String>('checkin_status', value);

  String? get checkinJustificativa => getField<String>('checkin_justificativa');
  set checkinJustificativa(String? value) =>
      setField<String>('checkin_justificativa', value);

  String? get checkinAprovadoPor => getField<String>('checkin_aprovado_por');
  set checkinAprovadoPor(String? value) =>
      setField<String>('checkin_aprovado_por', value);

  DateTime? get checkinAprovadoEm => getField<DateTime>('checkin_aprovado_em');
  set checkinAprovadoEm(DateTime? value) =>
      setField<DateTime>('checkin_aprovado_em', value);

  String? get checkinAprovadoPorNome =>
      getField<String>('checkin_aprovado_por_nome');
  set checkinAprovadoPorNome(String? value) =>
      setField<String>('checkin_aprovado_por_nome', value);

  DateTime? get checkoutHora => getField<DateTime>('checkout_hora');
  set checkoutHora(DateTime? value) =>
      setField<DateTime>('checkout_hora', value);

  String? get checkoutStatus => getField<String>('checkout_status');
  set checkoutStatus(String? value) =>
      setField<String>('checkout_status', value);

  String? get checkoutJustificativa =>
      getField<String>('checkout_justificativa');
  set checkoutJustificativa(String? value) =>
      setField<String>('checkout_justificativa', value);

  String? get checkoutAprovadoPor => getField<String>('checkout_aprovado_por');
  set checkoutAprovadoPor(String? value) =>
      setField<String>('checkout_aprovado_por', value);

  DateTime? get checkoutAprovadoEm =>
      getField<DateTime>('checkout_aprovado_em');
  set checkoutAprovadoEm(DateTime? value) =>
      setField<DateTime>('checkout_aprovado_em', value);

  String? get checkoutAprovadoPorNome =>
      getField<String>('checkout_aprovado_por_nome');
  set checkoutAprovadoPorNome(String? value) =>
      setField<String>('checkout_aprovado_por_nome', value);

  String? get pagamentoId => getField<String>('pagamento_id');
  set pagamentoId(String? value) => setField<String>('pagamento_id', value);

  String? get pagamentoStatus => getField<String>('pagamento_status');
  set pagamentoStatus(String? value) =>
      setField<String>('pagamento_status', value);

  int? get pagamentoValor => getField<int>('pagamento_valor');
  set pagamentoValor(int? value) => setField<int>('pagamento_valor', value);

  String? get autorizadoPor => getField<String>('autorizado_por');
  set autorizadoPor(String? value) => setField<String>('autorizado_por', value);

  DateTime? get autorizadoEm => getField<DateTime>('autorizado_em');
  set autorizadoEm(DateTime? value) =>
      setField<DateTime>('autorizado_em', value);

  String? get autorizadoPorNome => getField<String>('autorizado_por_nome');
  set autorizadoPorNome(String? value) =>
      setField<String>('autorizado_por_nome', value);

  DateTime? get pagoEm => getField<DateTime>('pago_em');
  set pagoEm(DateTime? value) => setField<DateTime>('pago_em', value);

  String? get pagoPor => getField<String>('pago_por');
  set pagoPor(String? value) => setField<String>('pago_por', value);

  String? get pagoPorNome => getField<String>('pago_por_nome');
  set pagoPorNome(String? value) => setField<String>('pago_por_nome', value);
}
