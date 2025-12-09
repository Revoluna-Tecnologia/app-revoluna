import '../database.dart';

class RequisitosTable extends SupabaseTable<RequisitosRow> {
  @override
  String get tableName => 'requisitos';

  @override
  RequisitosRow createRow(Map<String, dynamic> data) => RequisitosRow(data);
}

class RequisitosRow extends SupabaseDataRow {
  RequisitosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RequisitosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);
}
