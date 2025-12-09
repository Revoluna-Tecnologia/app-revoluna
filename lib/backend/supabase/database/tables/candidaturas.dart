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

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get dataConfirmacao => getField<DateTime>('data_confirmacao');
  set dataConfirmacao(DateTime? value) =>
      setField<DateTime>('data_confirmacao', value);

  String get medicoId => getField<String>('medico_id')!;
  set medicoId(String value) => setField<String>('medico_id', value);

  String get vagaId => getField<String>('vaga_id')!;
  set vagaId(String value) => setField<String>('vaga_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  int get vagaValor => getField<int>('vaga_valor')!;
  set vagaValor(int value) => setField<int>('vaga_valor', value);

  String? get medicoPrecadastroId => getField<String>('medico_precadastro_id');
  set medicoPrecadastroId(String? value) =>
      setField<String>('medico_precadastro_id', value);
}
