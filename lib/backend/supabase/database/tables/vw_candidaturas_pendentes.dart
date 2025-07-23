import '../database.dart';

class VwCandidaturasPendentesTable
    extends SupabaseTable<VwCandidaturasPendentesRow> {
  @override
  String get tableName => 'vw_candidaturas_pendentes';

  @override
  VwCandidaturasPendentesRow createRow(Map<String, dynamic> data) =>
      VwCandidaturasPendentesRow(data);
}

class VwCandidaturasPendentesRow extends SupabaseDataRow {
  VwCandidaturasPendentesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwCandidaturasPendentesTable();

  String? get nomeMedico => getField<String>('nome_medico');
  set nomeMedico(String? value) => setField<String>('nome_medico', value);

  String? get crmMedico => getField<String>('crm_medico');
  set crmMedico(String? value) => setField<String>('crm_medico', value);

  String? get nomeHospital => getField<String>('nome_hospital');
  set nomeHospital(String? value) => setField<String>('nome_hospital', value);

  DateTime? get dataPlantao => getField<DateTime>('data_plantao');
  set dataPlantao(DateTime? value) => setField<DateTime>('data_plantao', value);

  PostgresTime? get horaInicio => getField<PostgresTime>('hora_inicio');
  set horaInicio(PostgresTime? value) =>
      setField<PostgresTime>('hora_inicio', value);

  PostgresTime? get horaFim => getField<PostgresTime>('hora_fim');
  set horaFim(PostgresTime? value) => setField<PostgresTime>('hora_fim', value);

  String? get nomeEscalista => getField<String>('nome_escalista');
  set nomeEscalista(String? value) => setField<String>('nome_escalista', value);

  String? get telefoneEscalista => getField<String>('telefone_escalista');
  set telefoneEscalista(String? value) =>
      setField<String>('telefone_escalista', value);

  String? get statusCandidatura => getField<String>('status_candidatura');
  set statusCandidatura(String? value) =>
      setField<String>('status_candidatura', value);

  String? get candidaturasId => getField<String>('candidaturas_id');
  set candidaturasId(String? value) =>
      setField<String>('candidaturas_id', value);

  String? get medicosId => getField<String>('medicos_id');
  set medicosId(String? value) => setField<String>('medicos_id', value);

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  String? get especialidadeMedico => getField<String>('especialidade_medico');
  set especialidadeMedico(String? value) =>
      setField<String>('especialidade_medico', value);

  String? get especialidadeVaga => getField<String>('especialidade_vaga');
  set especialidadeVaga(String? value) =>
      setField<String>('especialidade_vaga', value);

  String? get telefoneMedico => getField<String>('telefone_medico');
  set telefoneMedico(String? value) =>
      setField<String>('telefone_medico', value);
}
