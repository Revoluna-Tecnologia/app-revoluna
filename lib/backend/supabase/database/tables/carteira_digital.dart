import '../database.dart';

class CarteiraDigitalTable extends SupabaseTable<CarteiraDigitalRow> {
  @override
  String get tableName => 'carteira_digital';

  @override
  CarteiraDigitalRow createRow(Map<String, dynamic> data) =>
      CarteiraDigitalRow(data);
}

class CarteiraDigitalRow extends SupabaseDataRow {
  CarteiraDigitalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarteiraDigitalTable();

  String get carteiraId => getField<String>('carteira_id')!;
  set carteiraId(String value) => setField<String>('carteira_id', value);

  String get medicoId => getField<String>('medico_id')!;
  set medicoId(String value) => setField<String>('medico_id', value);

  DateTime get carteiraCreatedate => getField<DateTime>('carteira_createdate')!;
  set carteiraCreatedate(DateTime value) =>
      setField<DateTime>('carteira_createdate', value);

  String get carteiraDiploma => getField<String>('carteira_diploma')!;
  set carteiraDiploma(String value) =>
      setField<String>('carteira_diploma', value);

  String get carteiraCrm => getField<String>('carteira_crm')!;
  set carteiraCrm(String value) => setField<String>('carteira_crm', value);

  String get carteiraCpf => getField<String>('carteira_cpf')!;
  set carteiraCpf(String value) => setField<String>('carteira_cpf', value);

  String get carteiraRg => getField<String>('carteira_rg')!;
  set carteiraRg(String value) => setField<String>('carteira_rg', value);

  String get carteiraEspecializacaodiploma =>
      getField<String>('carteira_especializacaodiploma')!;
  set carteiraEspecializacaodiploma(String value) =>
      setField<String>('carteira_especializacaodiploma', value);

  String get carteiraAnuidadecrm => getField<String>('carteira_anuidadecrm')!;
  set carteiraAnuidadecrm(String value) =>
      setField<String>('carteira_anuidadecrm', value);

  String get carteiraEticoprofissional =>
      getField<String>('carteira_eticoprofissional')!;
  set carteiraEticoprofissional(String value) =>
      setField<String>('carteira_eticoprofissional', value);

  String get carteiraComprovanteresidencia =>
      getField<String>('carteira_comprovanteresidencia')!;
  set carteiraComprovanteresidencia(String value) =>
      setField<String>('carteira_comprovanteresidencia', value);

  String get carteiraFoto => getField<String>('carteira_foto')!;
  set carteiraFoto(String value) => setField<String>('carteira_foto', value);

  String? get carteiraComprovantevacina =>
      getField<String>('carteira_comprovantevacina');
  set carteiraComprovantevacina(String? value) =>
      setField<String>('carteira_comprovantevacina', value);

  bool? get carteiraStatus => getField<bool>('carteira_status');
  set carteiraStatus(bool? value) => setField<bool>('carteira_status', value);

  bool? get carteiraDiplomaStatus => getField<bool>('carteira_diploma_status');
  set carteiraDiplomaStatus(bool? value) =>
      setField<bool>('carteira_diploma_status', value);

  bool? get carteiraCrmStatus => getField<bool>('carteira_crm_status');
  set carteiraCrmStatus(bool? value) =>
      setField<bool>('carteira_crm_status', value);

  bool? get carteiraCpfStatus => getField<bool>('carteira_cpf_status');
  set carteiraCpfStatus(bool? value) =>
      setField<bool>('carteira_cpf_status', value);

  bool? get carteiraRgStatus => getField<bool>('carteira_rg_status');
  set carteiraRgStatus(bool? value) =>
      setField<bool>('carteira_rg_status', value);

  bool? get carteiraEspecializacaodiplomaStatus =>
      getField<bool>('carteira_especializacaodiploma_status');
  set carteiraEspecializacaodiplomaStatus(bool? value) =>
      setField<bool>('carteira_especializacaodiploma_status', value);

  bool? get carteiraAnuidadecrmStatus =>
      getField<bool>('carteira_anuidadecrm_status');
  set carteiraAnuidadecrmStatus(bool? value) =>
      setField<bool>('carteira_anuidadecrm_status', value);

  bool? get carteiraEticoprofissionalStatus =>
      getField<bool>('carteira_eticoprofissional_status');
  set carteiraEticoprofissionalStatus(bool? value) =>
      setField<bool>('carteira_eticoprofissional_status', value);

  bool? get carteiraComprovanteresidenciaStatus =>
      getField<bool>('carteira_comprovanteresidencia_status');
  set carteiraComprovanteresidenciaStatus(bool? value) =>
      setField<bool>('carteira_comprovanteresidencia_status', value);

  bool? get carteiraFotoStatus => getField<bool>('carteira_foto_status');
  set carteiraFotoStatus(bool? value) =>
      setField<bool>('carteira_foto_status', value);

  bool? get carteiraComprovantevacinaStatus =>
      getField<bool>('carteira_comprovantevacina_status');
  set carteiraComprovantevacinaStatus(bool? value) =>
      setField<bool>('carteira_comprovantevacina_status', value);

  DateTime? get carteiraDiplomaUpdatedate =>
      getField<DateTime>('carteira_diploma_updatedate');
  set carteiraDiplomaUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_diploma_updatedate', value);

  DateTime? get carteiraCrmUpdatedate =>
      getField<DateTime>('carteira_crm_updatedate');
  set carteiraCrmUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_crm_updatedate', value);

  DateTime? get carteiraCpfUpdatedate =>
      getField<DateTime>('carteira_cpf_updatedate');
  set carteiraCpfUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_cpf_updatedate', value);

  DateTime? get carteiraRgUpdatedate =>
      getField<DateTime>('carteira_rg_updatedate');
  set carteiraRgUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_rg_updatedate', value);

  DateTime? get carteiraEspecializacaodiplomaUpdatedate =>
      getField<DateTime>('carteira_especializacaodiploma_updatedate');
  set carteiraEspecializacaodiplomaUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_especializacaodiploma_updatedate', value);

  DateTime? get carteiraAnuidadecrmUpdatedate =>
      getField<DateTime>('carteira_anuidadecrm_updatedate');
  set carteiraAnuidadecrmUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_anuidadecrm_updatedate', value);

  DateTime? get carteiraEticoprofissionalUpdatedate =>
      getField<DateTime>('carteira_eticoprofissional_updatedate');
  set carteiraEticoprofissionalUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_eticoprofissional_updatedate', value);

  DateTime? get carteiraComprovanteresidenciaUpdatedate =>
      getField<DateTime>('carteira_comprovanteresidencia_updatedate');
  set carteiraComprovanteresidenciaUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_comprovanteresidencia_updatedate', value);

  DateTime? get carteiraFotoUpdatedate =>
      getField<DateTime>('carteira_foto_updatedate');
  set carteiraFotoUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_foto_updatedate', value);

  DateTime? get carteiraComprovantevacinaUpdatedate =>
      getField<DateTime>('carteira_comprovantevacina_updatedate');
  set carteiraComprovantevacinaUpdatedate(DateTime? value) =>
      setField<DateTime>('carteira_comprovantevacina_updatedate', value);

  String? get carteiraDiplomaUpdateuserid =>
      getField<String>('carteira_diploma_updateuserid');
  set carteiraDiplomaUpdateuserid(String? value) =>
      setField<String>('carteira_diploma_updateuserid', value);

  String? get carteiraCrmUpdateuserid =>
      getField<String>('carteira_crm_updateuserid');
  set carteiraCrmUpdateuserid(String? value) =>
      setField<String>('carteira_crm_updateuserid', value);

  String? get carteiraCpfUpdateuserid =>
      getField<String>('carteira_cpf_updateuserid');
  set carteiraCpfUpdateuserid(String? value) =>
      setField<String>('carteira_cpf_updateuserid', value);

  String? get carteiraRgUpdateuserid =>
      getField<String>('carteira_rg_updateuserid');
  set carteiraRgUpdateuserid(String? value) =>
      setField<String>('carteira_rg_updateuserid', value);

  String? get carteiraEspecializacaodiplomaUpdateuserid =>
      getField<String>('carteira_especializacaodiploma_updateuserid');
  set carteiraEspecializacaodiplomaUpdateuserid(String? value) =>
      setField<String>('carteira_especializacaodiploma_updateuserid', value);

  String? get carteiraAnuidadecrmUpdateuserid =>
      getField<String>('carteira_anuidadecrm_updateuserid');
  set carteiraAnuidadecrmUpdateuserid(String? value) =>
      setField<String>('carteira_anuidadecrm_updateuserid', value);

  String? get carteiraEticoprofissionalUpdateuserid =>
      getField<String>('carteira_eticoprofissional_updateuserid');
  set carteiraEticoprofissionalUpdateuserid(String? value) =>
      setField<String>('carteira_eticoprofissional_updateuserid', value);

  String? get carteiraComprovanteresidenciaUpdateuserid =>
      getField<String>('carteira_comprovanteresidencia_updateuserid');
  set carteiraComprovanteresidenciaUpdateuserid(String? value) =>
      setField<String>('carteira_comprovanteresidencia_updateuserid', value);

  String? get carteiraFotoUpdateuserid =>
      getField<String>('carteira_foto_updateuserid');
  set carteiraFotoUpdateuserid(String? value) =>
      setField<String>('carteira_foto_updateuserid', value);

  String? get carteiraComprovantevacinaUpdateuserid =>
      getField<String>('carteira_comprovantevacina_updateuserid');
  set carteiraComprovantevacinaUpdateuserid(String? value) =>
      setField<String>('carteira_comprovantevacina_updateuserid', value);
}
