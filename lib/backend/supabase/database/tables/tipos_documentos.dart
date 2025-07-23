import '../database.dart';

class TiposDocumentosTable extends SupabaseTable<TiposDocumentosRow> {
  @override
  String get tableName => 'tipos_documentos';

  @override
  TiposDocumentosRow createRow(Map<String, dynamic> data) =>
      TiposDocumentosRow(data);
}

class TiposDocumentosRow extends SupabaseDataRow {
  TiposDocumentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TiposDocumentosTable();

  String get tipo => getField<String>('tipo')!;
  set tipo(String value) => setField<String>('tipo', value);

  String get label => getField<String>('label')!;
  set label(String value) => setField<String>('label', value);

  bool? get obrigatorio => getField<bool>('obrigatorio');
  set obrigatorio(bool? value) => setField<bool>('obrigatorio', value);
}
