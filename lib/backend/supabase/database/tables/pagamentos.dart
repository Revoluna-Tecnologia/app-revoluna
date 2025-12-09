import '../database.dart';

class PagamentosTable extends SupabaseTable<PagamentosRow> {
  @override
  String get tableName => 'pagamentos';

  @override
  PagamentosRow createRow(Map<String, dynamic> data) => PagamentosRow(data);
}

class PagamentosRow extends SupabaseDataRow {
  PagamentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagamentosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get medicoId => getField<String>('medico_id');
  set medicoId(String? value) => setField<String>('medico_id', value);

  String? get candidaturaId => getField<String>('candidatura_id');
  set candidaturaId(String? value) => setField<String>('candidatura_id', value);

  int get valor => getField<int>('valor')!;
  set valor(int value) => setField<int>('valor', value);

  String? get vagaId => getField<String>('vaga_id');
  set vagaId(String? value) => setField<String>('vaga_id', value);

  String? get medicosId => getField<String>('medicos_id');
  set medicosId(String? value) => setField<String>('medicos_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get autorizadoPor => getField<String>('autorizado_por');
  set autorizadoPor(String? value) => setField<String>('autorizado_por', value);

  DateTime? get autorizadoEm => getField<DateTime>('autorizado_em');
  set autorizadoEm(DateTime? value) =>
      setField<DateTime>('autorizado_em', value);

  DateTime? get pagoEm => getField<DateTime>('pago_em');
  set pagoEm(DateTime? value) => setField<DateTime>('pago_em', value);

  String? get pagoPor => getField<String>('pago_por');
  set pagoPor(String? value) => setField<String>('pago_por', value);
}
