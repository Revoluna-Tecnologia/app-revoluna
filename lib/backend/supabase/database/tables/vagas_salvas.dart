import '../database.dart';

class VagasSalvasTable extends SupabaseTable<VagasSalvasRow> {
  @override
  String get tableName => 'vagas_salvas';

  @override
  VagasSalvasRow createRow(Map<String, dynamic> data) => VagasSalvasRow(data);
}

class VagasSalvasRow extends SupabaseDataRow {
  VagasSalvasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasSalvasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get vagasId => getField<String>('vagas_id')!;
  set vagasId(String value) => setField<String>('vagas_id', value);

  String get medicoId => getField<String>('medico_id')!;
  set medicoId(String value) => setField<String>('medico_id', value);
}
