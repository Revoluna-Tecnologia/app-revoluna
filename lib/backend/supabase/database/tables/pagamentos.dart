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

  String get pagamentoId => getField<String>('pagamento_id')!;
  set pagamentoId(String value) => setField<String>('pagamento_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get medicosId => getField<String>('medicos_id');
  set medicosId(String? value) => setField<String>('medicos_id', value);

  String? get candidaturasId => getField<String>('candidaturas_id');
  set candidaturasId(String? value) =>
      setField<String>('candidaturas_id', value);

  int get valor => getField<int>('valor')!;
  set valor(int value) => setField<int>('valor', value);

  String get vagasId => getField<String>('vagas_id')!;
  set vagasId(String value) => setField<String>('vagas_id', value);
}
