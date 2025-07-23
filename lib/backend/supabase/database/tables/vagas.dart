import '../database.dart';

class VagasTable extends SupabaseTable<VagasRow> {
  @override
  String get tableName => 'vagas';

  @override
  VagasRow createRow(Map<String, dynamic> data) => VagasRow(data);
}

class VagasRow extends SupabaseDataRow {
  VagasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasTable();

  String get vagasId => getField<String>('vagas_id')!;
  set vagasId(String value) => setField<String>('vagas_id', value);

  DateTime get vagasCreatedate => getField<DateTime>('vagas_createdate')!;
  set vagasCreatedate(DateTime value) =>
      setField<DateTime>('vagas_createdate', value);

  String get vagasHospital => getField<String>('vagas_hospital')!;
  set vagasHospital(String value) => setField<String>('vagas_hospital', value);

  DateTime? get vagasData => getField<DateTime>('vagas_data');
  set vagasData(DateTime? value) => setField<DateTime>('vagas_data', value);

  String get vagasPeriodo => getField<String>('vagas_periodo')!;
  set vagasPeriodo(String value) => setField<String>('vagas_periodo', value);

  PostgresTime get vagasHorainicio =>
      getField<PostgresTime>('vagas_horainicio')!;
  set vagasHorainicio(PostgresTime value) =>
      setField<PostgresTime>('vagas_horainicio', value);

  PostgresTime get vagasHorafim => getField<PostgresTime>('vagas_horafim')!;
  set vagasHorafim(PostgresTime value) =>
      setField<PostgresTime>('vagas_horafim', value);

  int get vagasValor => getField<int>('vagas_valor')!;
  set vagasValor(int value) => setField<int>('vagas_valor', value);

  DateTime get vagasDatapagamento => getField<DateTime>('vagas_datapagamento')!;
  set vagasDatapagamento(DateTime value) =>
      setField<DateTime>('vagas_datapagamento', value);

  String get vagasTipo => getField<String>('vagas_tipo')!;
  set vagasTipo(String value) => setField<String>('vagas_tipo', value);

  String? get vagasObservacoes => getField<String>('vagas_observacoes');
  set vagasObservacoes(String? value) =>
      setField<String>('vagas_observacoes', value);

  String get vagasSetor => getField<String>('vagas_setor')!;
  set vagasSetor(String value) => setField<String>('vagas_setor', value);

  String get vagasEscalista => getField<String>('vagas_escalista')!;
  set vagasEscalista(String value) =>
      setField<String>('vagas_escalista', value);

  DateTime? get vagasUpdateat => getField<DateTime>('vagas_updateat');
  set vagasUpdateat(DateTime? value) =>
      setField<DateTime>('vagas_updateat', value);

  String get vagasUpdateby => getField<String>('vagas_updateby')!;
  set vagasUpdateby(String value) => setField<String>('vagas_updateby', value);

  DateTime? get vagasDeleteat => getField<DateTime>('vagas_deleteat');
  set vagasDeleteat(DateTime? value) =>
      setField<DateTime>('vagas_deleteat', value);

  String? get vagasStatus => getField<String>('vagas_status');
  set vagasStatus(String? value) => setField<String>('vagas_status', value);

  int? get vagasTotalcandidaturas => getField<int>('vagas_totalcandidaturas');
  set vagasTotalcandidaturas(int? value) =>
      setField<int>('vagas_totalcandidaturas', value);

  String get vagaEspecialidade => getField<String>('vaga_especialidade')!;
  set vagaEspecialidade(String value) =>
      setField<String>('vaga_especialidade', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  int get index => getField<int>('Index')!;
  set index(int value) => setField<int>('Index', value);

  String? get vagasFormarecebimento =>
      getField<String>('vagas_formarecebimento');
  set vagasFormarecebimento(String? value) =>
      setField<String>('vagas_formarecebimento', value);

  String? get recorrenciaId => getField<String>('recorrencia_id');
  set recorrenciaId(String? value) => setField<String>('recorrencia_id', value);
}
