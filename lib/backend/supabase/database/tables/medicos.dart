import '../database.dart';

class MedicosTable extends SupabaseTable<MedicosRow> {
  @override
  String get tableName => 'medicos';

  @override
  MedicosRow createRow(Map<String, dynamic> data) => MedicosRow(data);
}

class MedicosRow extends SupabaseDataRow {
  MedicosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MedicosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get medicoRqe => getField<String>('medico_rqe');
  set medicoRqe(String? value) => setField<String>('medico_rqe', value);

  String? get medicoGenero => getField<String>('medico_genero');
  set medicoGenero(String? value) => setField<String>('medico_genero', value);

  String? get medicoCpf => getField<String>('medico_cpf');
  set medicoCpf(String? value) => setField<String>('medico_cpf', value);

  String? get medicoRg => getField<String>('medico_rg');
  set medicoRg(String? value) => setField<String>('medico_rg', value);

  String? get medicoCrm => getField<String>('medico_crm');
  set medicoCrm(String? value) => setField<String>('medico_crm', value);

  String? get medicoNomedafaculdade =>
      getField<String>('medico_nomedafaculdade');
  set medicoNomedafaculdade(String? value) =>
      setField<String>('medico_nomedafaculdade', value);

  String? get medicoTipofaculdade => getField<String>('medico_tipofaculdade');
  set medicoTipofaculdade(String? value) =>
      setField<String>('medico_tipofaculdade', value);

  String? get medicoPrimeironome => getField<String>('medico_primeironome');
  set medicoPrimeironome(String? value) =>
      setField<String>('medico_primeironome', value);

  String? get medicoSobrenome => getField<String>('medico_sobrenome');
  set medicoSobrenome(String? value) =>
      setField<String>('medico_sobrenome', value);

  String? get medicoEmail => getField<String>('medico_email');
  set medicoEmail(String? value) => setField<String>('medico_email', value);

  String? get medicoTelefone => getField<String>('medico_telefone');
  set medicoTelefone(String? value) =>
      setField<String>('medico_telefone', value);

  DateTime? get medicoDatanascimento =>
      getField<DateTime>('medico_datanascimento');
  set medicoDatanascimento(DateTime? value) =>
      setField<DateTime>('medico_datanascimento', value);

  String? get medicoLogradouro => getField<String>('medico_logradouro');
  set medicoLogradouro(String? value) =>
      setField<String>('medico_logradouro', value);

  String? get medicoNumero => getField<String>('medico_numero');
  set medicoNumero(String? value) => setField<String>('medico_numero', value);

  String? get medicoBairro => getField<String>('medico_bairro');
  set medicoBairro(String? value) => setField<String>('medico_bairro', value);

  String? get medicoCidade => getField<String>('medico_cidade');
  set medicoCidade(String? value) => setField<String>('medico_cidade', value);

  String? get medicoEstado => getField<String>('medico_estado');
  set medicoEstado(String? value) => setField<String>('medico_estado', value);

  String? get medicoPais => getField<String>('medico_pais');
  set medicoPais(String? value) => setField<String>('medico_pais', value);

  String? get medicoCep => getField<String>('medico_cep');
  set medicoCep(String? value) => setField<String>('medico_cep', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get medicoUpdateat => getField<DateTime>('medico_updateat');
  set medicoUpdateat(DateTime? value) =>
      setField<DateTime>('medico_updateat', value);

  String? get medicoUpdateby => getField<String>('medico_updateby');
  set medicoUpdateby(String? value) =>
      setField<String>('medico_updateby', value);

  DateTime? get medicoDeleteat => getField<DateTime>('medico_deleteat');
  set medicoDeleteat(DateTime? value) =>
      setField<DateTime>('medico_deleteat', value);

  String? get medicoStatus => getField<String>('medico_status');
  set medicoStatus(String? value) => setField<String>('medico_status', value);

  int? get medicoTotalplantoes => getField<int>('medico_totalplantoes');
  set medicoTotalplantoes(int? value) =>
      setField<int>('medico_totalplantoes', value);

  String? get medicoEspecialidade => getField<String>('medico_especialidade');
  set medicoEspecialidade(String? value) =>
      setField<String>('medico_especialidade', value);

  int? get medicoAnoterminoespecializacao =>
      getField<int>('medico_anoterminoespecializacao');
  set medicoAnoterminoespecializacao(int? value) =>
      setField<int>('medico_anoterminoespecializacao', value);

  int? get medicoAnoformatura => getField<int>('medico_anoformatura');
  set medicoAnoformatura(int? value) =>
      setField<int>('medico_anoformatura', value);

  bool? get trackingPrivacy => getField<bool>('tracking_privacy');
  set trackingPrivacy(bool? value) => setField<bool>('tracking_privacy', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);

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
}
