import '../database.dart';

class VwFolhaPagamentoTable extends SupabaseTable<VwFolhaPagamentoRow> {
  @override
  String get tableName => 'vw_folha_pagamento';

  @override
  VwFolhaPagamentoRow createRow(Map<String, dynamic> data) =>
      VwFolhaPagamentoRow(data);
}

class VwFolhaPagamentoRow extends SupabaseDataRow {
  VwFolhaPagamentoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwFolhaPagamentoTable();

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  DateTime? get vagasData => getField<DateTime>('vagas_data');
  set vagasData(DateTime? value) => setField<DateTime>('vagas_data', value);

  String? get periodoNome => getField<String>('periodo_nome');
  set periodoNome(String? value) => setField<String>('periodo_nome', value);

  PostgresTime? get horarioInicio => getField<PostgresTime>('horario_inicio');
  set horarioInicio(PostgresTime? value) =>
      setField<PostgresTime>('horario_inicio', value);

  PostgresTime? get horarioFim => getField<PostgresTime>('horario_fim');
  set horarioFim(PostgresTime? value) =>
      setField<PostgresTime>('horario_fim', value);

  int? get vagasValor => getField<int>('vagas_valor');
  set vagasValor(int? value) => setField<int>('vagas_valor', value);

  DateTime? get vagasDatapagamento => getField<DateTime>('vagas_datapagamento');
  set vagasDatapagamento(DateTime? value) =>
      setField<DateTime>('vagas_datapagamento', value);

  String? get formaRecebimento => getField<String>('forma_recebimento');
  set formaRecebimento(String? value) =>
      setField<String>('forma_recebimento', value);

  String? get hospitalNome => getField<String>('hospital_nome');
  set hospitalNome(String? value) => setField<String>('hospital_nome', value);

  String? get vagasEspecialidade => getField<String>('vagas_especialidade');
  set vagasEspecialidade(String? value) =>
      setField<String>('vagas_especialidade', value);

  String? get setorNome => getField<String>('setor_nome');
  set setorNome(String? value) => setField<String>('setor_nome', value);

  String? get candidaturasId => getField<String>('candidaturas_id');
  set candidaturasId(String? value) =>
      setField<String>('candidaturas_id', value);

  String? get medicoId => getField<String>('medico_id');
  set medicoId(String? value) => setField<String>('medico_id', value);

  String? get medicoPrecadastroId => getField<String>('medico_precadastro_id');
  set medicoPrecadastroId(String? value) =>
      setField<String>('medico_precadastro_id', value);

  String? get candidaturaStatus => getField<String>('candidatura_status');
  set candidaturaStatus(String? value) =>
      setField<String>('candidatura_status', value);

  DateTime? get candidatosDataconfirmacao =>
      getField<DateTime>('candidatos_dataconfirmacao');
  set candidatosDataconfirmacao(DateTime? value) =>
      setField<DateTime>('candidatos_dataconfirmacao', value);

  String? get medicoPrimeironome => getField<String>('medico_primeironome');
  set medicoPrimeironome(String? value) =>
      setField<String>('medico_primeironome', value);

  String? get medicoSobrenome => getField<String>('medico_sobrenome');
  set medicoSobrenome(String? value) =>
      setField<String>('medico_sobrenome', value);

  String? get medicoCpf => getField<String>('medico_cpf');
  set medicoCpf(String? value) => setField<String>('medico_cpf', value);

  String? get medicoCrm => getField<String>('medico_crm');
  set medicoCrm(String? value) => setField<String>('medico_crm', value);

  String? get medicoEspecialidade => getField<String>('medico_especialidade');
  set medicoEspecialidade(String? value) =>
      setField<String>('medico_especialidade', value);

  String? get razaoSocial => getField<String>('razao_social');
  set razaoSocial(String? value) => setField<String>('razao_social', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  String? get bancoAgencia => getField<String>('banco_agencia');
  set bancoAgencia(String? value) => setField<String>('banco_agencia', value);

  String? get bancoDigito => getField<String>('banco_digito');
  set bancoDigito(String? value) => setField<String>('banco_digito', value);

  String? get bancoConta => getField<String>('banco_conta');
  set bancoConta(String? value) => setField<String>('banco_conta', value);

  String? get bancoPix => getField<String>('banco_pix');
  set bancoPix(String? value) => setField<String>('banco_pix', value);

  DateTime? get checkin => getField<DateTime>('checkin');
  set checkin(DateTime? value) => setField<DateTime>('checkin', value);

  DateTime? get checkout => getField<DateTime>('checkout');
  set checkout(DateTime? value) => setField<DateTime>('checkout', value);

  double? get checkinLatitude => getField<double>('checkin_latitude');
  set checkinLatitude(double? value) =>
      setField<double>('checkin_latitude', value);

  double? get checkinLongitude => getField<double>('checkin_longitude');
  set checkinLongitude(double? value) =>
      setField<double>('checkin_longitude', value);

  double? get checkoutLatitude => getField<double>('checkout_latitude');
  set checkoutLatitude(double? value) =>
      setField<double>('checkout_latitude', value);

  double? get checkoutLongitude => getField<double>('checkout_longitude');
  set checkoutLongitude(double? value) =>
      setField<double>('checkout_longitude', value);

  String? get checkinJustificativa => getField<String>('checkin_justificativa');
  set checkinJustificativa(String? value) =>
      setField<String>('checkin_justificativa', value);

  String? get checkoutJustificativa =>
      getField<String>('checkout_justificativa');
  set checkoutJustificativa(String? value) =>
      setField<String>('checkout_justificativa', value);
}
