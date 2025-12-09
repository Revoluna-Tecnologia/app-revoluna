import '../database.dart';

class VagasBeneficiosTable extends SupabaseTable<VagasBeneficiosRow> {
  @override
  String get tableName => 'vagas_beneficios';

  @override
  VagasBeneficiosRow createRow(Map<String, dynamic> data) =>
      VagasBeneficiosRow(data);
}

class VagasBeneficiosRow extends SupabaseDataRow {
  VagasBeneficiosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasBeneficiosTable();

  String get vagaId => getField<String>('vaga_id')!;
  set vagaId(String value) => setField<String>('vaga_id', value);

  String get beneficioId => getField<String>('beneficio_id')!;
  set beneficioId(String value) => setField<String>('beneficio_id', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
