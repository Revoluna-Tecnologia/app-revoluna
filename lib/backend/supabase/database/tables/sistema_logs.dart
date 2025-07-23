import '../database.dart';

class SistemaLogsTable extends SupabaseTable<SistemaLogsRow> {
  @override
  String get tableName => 'sistema_logs';

  @override
  SistemaLogsRow createRow(Map<String, dynamic> data) => SistemaLogsRow(data);
}

class SistemaLogsRow extends SupabaseDataRow {
  SistemaLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SistemaLogsTable();

  String get logId => getField<String>('log_id')!;
  set logId(String value) => setField<String>('log_id', value);

  String get logTipo => getField<String>('log_tipo')!;
  set logTipo(String value) => setField<String>('log_tipo', value);

  String get logDescricao => getField<String>('log_descricao')!;
  set logDescricao(String value) => setField<String>('log_descricao', value);

  DateTime get logData => getField<DateTime>('log_data')!;
  set logData(DateTime value) => setField<DateTime>('log_data', value);

  dynamic? get logDetalhes => getField<dynamic>('log_detalhes');
  set logDetalhes(dynamic? value) => setField<dynamic>('log_detalhes', value);
}
