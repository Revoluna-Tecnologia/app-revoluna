import '../database.dart';

class BeneficioTipoTable extends SupabaseTable<BeneficioTipoRow> {
  @override
  String get tableName => 'beneficio_tipo';

  @override
  BeneficioTipoRow createRow(Map<String, dynamic> data) =>
      BeneficioTipoRow(data);
}

class BeneficioTipoRow extends SupabaseDataRow {
  BeneficioTipoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BeneficioTipoTable();

  String get beneficioId => getField<String>('beneficio_id')!;
  set beneficioId(String value) => setField<String>('beneficio_id', value);

  String get beneficioNome => getField<String>('beneficio_nome')!;
  set beneficioNome(String value) => setField<String>('beneficio_nome', value);
}
