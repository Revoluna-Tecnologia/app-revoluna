import '../database.dart';

class VagasRequisitosTable extends SupabaseTable<VagasRequisitosRow> {
  @override
  String get tableName => 'vagas_requisitos';

  @override
  VagasRequisitosRow createRow(Map<String, dynamic> data) =>
      VagasRequisitosRow(data);
}

class VagasRequisitosRow extends SupabaseDataRow {
  VagasRequisitosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasRequisitosTable();

  String get vagaId => getField<String>('vaga_id')!;
  set vagaId(String value) => setField<String>('vaga_id', value);

  String get requisitoId => getField<String>('requisito_id')!;
  set requisitoId(String value) => setField<String>('requisito_id', value);
}
