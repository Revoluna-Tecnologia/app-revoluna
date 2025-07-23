import '../database.dart';

class FormasRecebimentoTable extends SupabaseTable<FormasRecebimentoRow> {
  @override
  String get tableName => 'formas_recebimento';

  @override
  FormasRecebimentoRow createRow(Map<String, dynamic> data) =>
      FormasRecebimentoRow(data);
}

class FormasRecebimentoRow extends SupabaseDataRow {
  FormasRecebimentoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FormasRecebimentoTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get formaRecebimento => getField<String>('forma_recebimento');
  set formaRecebimento(String? value) =>
      setField<String>('forma_recebimento', value);
}
