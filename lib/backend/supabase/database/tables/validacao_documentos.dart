import '../database.dart';

class ValidacaoDocumentosTable extends SupabaseTable<ValidacaoDocumentosRow> {
  @override
  String get tableName => 'validacao_documentos';

  @override
  ValidacaoDocumentosRow createRow(Map<String, dynamic> data) =>
      ValidacaoDocumentosRow(data);
}

class ValidacaoDocumentosRow extends SupabaseDataRow {
  ValidacaoDocumentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ValidacaoDocumentosTable();

  String get carteiraId => getField<String>('carteira_id')!;
  set carteiraId(String value) => setField<String>('carteira_id', value);

  DateTime? get carteiraAlteracao => getField<DateTime>('carteira_alteracao');
  set carteiraAlteracao(DateTime? value) =>
      setField<DateTime>('carteira_alteracao', value);

  String? get validacaoby => getField<String>('validacaoby');
  set validacaoby(String? value) => setField<String>('validacaoby', value);

  String? get carteiraDiploma => getField<String>('carteira_diploma');
  set carteiraDiploma(String? value) =>
      setField<String>('carteira_diploma', value);

  String? get carteiraCrm => getField<String>('carteira_crm');
  set carteiraCrm(String? value) => setField<String>('carteira_crm', value);

  String? get carteiraCpf => getField<String>('carteira_cpf');
  set carteiraCpf(String? value) => setField<String>('carteira_cpf', value);

  String? get carteiraRg => getField<String>('carteira_rg');
  set carteiraRg(String? value) => setField<String>('carteira_rg', value);

  String? get carteiraEspecializacaodiploma =>
      getField<String>('carteira_especializacaodiploma');
  set carteiraEspecializacaodiploma(String? value) =>
      setField<String>('carteira_especializacaodiploma', value);

  String? get carteiraAnuidadecrm => getField<String>('carteira_anuidadecrm');
  set carteiraAnuidadecrm(String? value) =>
      setField<String>('carteira_anuidadecrm', value);

  String? get carteiraEticoprofissional =>
      getField<String>('carteira_eticoprofissional');
  set carteiraEticoprofissional(String? value) =>
      setField<String>('carteira_eticoprofissional', value);

  String? get carteiraComprovanteresidencia =>
      getField<String>('carteira_comprovanteresidencia');
  set carteiraComprovanteresidencia(String? value) =>
      setField<String>('carteira_comprovanteresidencia', value);

  String? get carteiraFoto => getField<String>('carteira_foto');
  set carteiraFoto(String? value) => setField<String>('carteira_foto', value);

  String? get carteiraComprovantevacina =>
      getField<String>('carteira_comprovantevacina');
  set carteiraComprovantevacina(String? value) =>
      setField<String>('carteira_comprovantevacina', value);
}
