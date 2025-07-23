import '../database.dart';

class VagasBeneficioTable extends SupabaseTable<VagasBeneficioRow> {
  @override
  String get tableName => 'vagas_beneficio';

  @override
  VagasBeneficioRow createRow(Map<String, dynamic> data) =>
      VagasBeneficioRow(data);
}

class VagasBeneficioRow extends SupabaseDataRow {
  VagasBeneficioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VagasBeneficioTable();

  String get vagasId => getField<String>('vagas_id')!;
  set vagasId(String value) => setField<String>('vagas_id', value);

  String get beneficioId => getField<String>('beneficio_id')!;
  set beneficioId(String value) => setField<String>('beneficio_id', value);

  String? get vagaId => getField<String>('vaga_id');
  set vagaId(String? value) => setField<String>('vaga_id', value);

  int get index => getField<int>('Index')!;
  set index(int value) => setField<int>('Index', value);
}
