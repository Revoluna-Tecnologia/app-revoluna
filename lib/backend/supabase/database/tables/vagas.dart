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

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get hospitalId => getField<String>('hospital_id')!;
  set hospitalId(String value) => setField<String>('hospital_id', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String get periodoId => getField<String>('periodo_id')!;
  set periodoId(String value) => setField<String>('periodo_id', value);

  PostgresTime get horaInicio => getField<PostgresTime>('hora_inicio')!;
  set horaInicio(PostgresTime value) =>
      setField<PostgresTime>('hora_inicio', value);

  PostgresTime get horaFim => getField<PostgresTime>('hora_fim')!;
  set horaFim(PostgresTime value) => setField<PostgresTime>('hora_fim', value);

  int get valor => getField<int>('valor')!;
  set valor(int value) => setField<int>('valor', value);

  DateTime get dataPagamento => getField<DateTime>('data_pagamento')!;
  set dataPagamento(DateTime value) =>
      setField<DateTime>('data_pagamento', value);

  String get tiposVagaId => getField<String>('tipos_vaga_id')!;
  set tiposVagaId(String value) => setField<String>('tipos_vaga_id', value);

  String? get observacoes => getField<String>('observacoes');
  set observacoes(String? value) => setField<String>('observacoes', value);

  String get setorId => getField<String>('setor_id')!;
  set setorId(String value) => setField<String>('setor_id', value);

  String get escalistaId => getField<String>('escalista_id')!;
  set escalistaId(String value) => setField<String>('escalista_id', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get updatedBy => getField<String>('updated_by')!;
  set updatedBy(String value) => setField<String>('updated_by', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get totalCandidaturas => getField<int>('total_candidaturas');
  set totalCandidaturas(int? value) =>
      setField<int>('total_candidaturas', value);

  String get especialidadeId => getField<String>('especialidade_id')!;
  set especialidadeId(String value) =>
      setField<String>('especialidade_id', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  int get index => getField<int>('index')!;
  set index(int value) => setField<int>('index', value);

  String? get formaRecebimentoId => getField<String>('forma_recebimento_id');
  set formaRecebimentoId(String? value) =>
      setField<String>('forma_recebimento_id', value);

  String? get recorrenciaId => getField<String>('recorrencia_id');
  set recorrenciaId(String? value) => setField<String>('recorrencia_id', value);

  String? get gradeId => getField<String>('grade_id');
  set gradeId(String? value) => setField<String>('grade_id', value);
}
