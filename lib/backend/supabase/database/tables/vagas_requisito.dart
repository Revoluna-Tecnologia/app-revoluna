import '../database.dart';

class VagasRequisitoTable extends SupabaseTable<VagasRequisitoRow> {
  @override
  String get tableName => 'vagas_requisito';

  @override
  VagasRequisitoRow createRow(Map<String, dynamic> data) =>
      VagasRequisitoRow(data);
}

class VagasRequisitoRow extends SupabaseDataRow {
  VagasRequisitoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasRequisitoTable();

  String get vagasId => getField<String>('vagas_id')!;
  set vagasId(String value) => setField<String>('vagas_id', value);

  String get requisitoId => getField<String>('requisito_id')!;
  set requisitoId(String value) => setField<String>('requisito_id', value);
}
