import '../database.dart';

class CandidaturasTable extends SupabaseTable<CandidaturasRow> {
  @override
  String get tableName => 'candidaturas';

  @override
  CandidaturasRow createRow(Map<String, dynamic> data) => CandidaturasRow(data);
}

class CandidaturasRow extends SupabaseDataRow {
  CandidaturasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CandidaturasTable();

  String get candidaturasId => getField<String>('candidaturas_id')!;
  set candidaturasId(String value) =>
      setField<String>('candidaturas_id', value);

  DateTime? get candidatosCreatedate =>
      getField<DateTime>('candidatos_createdate');
  set candidatosCreatedate(DateTime? value) =>
      setField<DateTime>('candidatos_createdate', value);

  DateTime? get candidatosDataconfirmacao =>
      getField<DateTime>('candidatos_dataconfirmacao');
  set candidatosDataconfirmacao(DateTime? value) =>
      setField<DateTime>('candidatos_dataconfirmacao', value);

  String get medicoId => getField<String>('medico_id')!;
  set medicoId(String value) => setField<String>('medico_id', value);

  String get vagasId => getField<String>('vagas_id')!;
  set vagasId(String value) => setField<String>('vagas_id', value);

  String get candidaturaStatus => getField<String>('candidatura_status')!;
  set candidaturaStatus(String value) =>
      setField<String>('candidatura_status', value);

  DateTime? get candidaturasUpdateat =>
      getField<DateTime>('candidaturas_updateat');
  set candidaturasUpdateat(DateTime? value) =>
      setField<DateTime>('candidaturas_updateat', value);

  String? get candidaturasUpdateby => getField<String>('candidaturas_updateby');
  set candidaturasUpdateby(String? value) =>
      setField<String>('candidaturas_updateby', value);

  int get vagasValor => getField<int>('vagas_valor')!;
  set vagasValor(int value) => setField<int>('vagas_valor', value);

  String? get medicoPrecadastroId => getField<String>('medico_precadastro_id');
  set medicoPrecadastroId(String? value) =>
      setField<String>('medico_precadastro_id', value);
}
