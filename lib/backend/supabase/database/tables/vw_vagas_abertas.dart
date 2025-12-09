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

  String? get formarecebimentoId => getField<String>('formarecebimento_id');
  set formarecebimentoId(String? value) =>
      setField<String>('formarecebimento_id', value);

  String? get formarecebimentoNome => getField<String>('formarecebimento_nome');
  set formarecebimentoNome(String? value) =>
      setField<String>('formarecebimento_nome', value);

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
}
