import '../database.dart';

class VwRelatorioFolhapagamentoTable
    extends SupabaseTable<VwRelatorioFolhapagamentoRow> {
  @override
  String get tableName => 'vw_relatorio_folhapagamento';

  @override
  VwRelatorioFolhapagamentoRow createRow(Map<String, dynamic> data) =>
      VwRelatorioFolhapagamentoRow(data);
}

class VwRelatorioFolhapagamentoRow extends SupabaseDataRow {
  VwRelatorioFolhapagamentoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwRelatorioFolhapagamentoTable();

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  DateTime? get vagasData => getField<DateTime>('vagas_data');
  set vagasData(DateTime? value) => setField<DateTime>('vagas_data', value);

  DateTime? get vagasDatapagamento => getField<DateTime>('vagas_datapagamento');
  set vagasDatapagamento(DateTime? value) =>
      setField<DateTime>('vagas_datapagamento', value);

  int? get vagasValor => getField<int>('vagas_valor');
  set vagasValor(int? value) => setField<int>('vagas_valor', value);

  String? get hospitalId => getField<String>('hospital_id');
  set hospitalId(String? value) => setField<String>('hospital_id', value);

  String? get hospitalNome => getField<String>('hospital_nome');
  set hospitalNome(String? value) => setField<String>('hospital_nome', value);

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

  String? get candidaturaStatus => getField<String>('candidatura_status');
  set candidaturaStatus(String? value) =>
      setField<String>('candidatura_status', value);
}
