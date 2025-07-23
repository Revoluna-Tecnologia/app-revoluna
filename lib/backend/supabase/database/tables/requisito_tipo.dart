import '../database.dart';

class RequisitoTipoTable extends SupabaseTable<RequisitoTipoRow> {
  @override
  String get tableName => 'requisito_tipo';

  @override
  RequisitoTipoRow createRow(Map<String, dynamic> data) =>
      RequisitoTipoRow(data);
}

class RequisitoTipoRow extends SupabaseDataRow {
  RequisitoTipoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RequisitoTipoTable();

  String get requisitoId => getField<String>('requisito_id')!;
  set requisitoId(String value) => setField<String>('requisito_id', value);

  String get requisitoNome => getField<String>('requisito_nome')!;
  set requisitoNome(String value) => setField<String>('requisito_nome', value);
}
