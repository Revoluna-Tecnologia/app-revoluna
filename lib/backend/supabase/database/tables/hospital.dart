import '../database.dart';

class HospitalTable extends SupabaseTable<HospitalRow> {
  @override
  String get tableName => 'hospital';

  @override
  HospitalRow createRow(Map<String, dynamic> data) => HospitalRow(data);
}

class HospitalRow extends SupabaseDataRow {
  HospitalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HospitalTable();

  String get hospitalId => getField<String>('hospital_id')!;
  set hospitalId(String value) => setField<String>('hospital_id', value);

  String get hospitalNome => getField<String>('hospital_nome')!;
  set hospitalNome(String value) => setField<String>('hospital_nome', value);

  String get hospitalLogradouro => getField<String>('hospital_logradouro')!;
  set hospitalLogradouro(String value) =>
      setField<String>('hospital_logradouro', value);

  String get hospitalNumero => getField<String>('hospital_numero')!;
  set hospitalNumero(String value) =>
      setField<String>('hospital_numero', value);

  String get hospitalCidade => getField<String>('hospital_cidade')!;
  set hospitalCidade(String value) =>
      setField<String>('hospital_cidade', value);

  String get hospitalBairro => getField<String>('hospital_bairro')!;
  set hospitalBairro(String value) =>
      setField<String>('hospital_bairro', value);

  String get hospitalEstado => getField<String>('hospital_estado')!;
  set hospitalEstado(String value) =>
      setField<String>('hospital_estado', value);

  String get hospitalPais => getField<String>('hospital_pais')!;
  set hospitalPais(String value) => setField<String>('hospital_pais', value);

  String get hospitalCep => getField<String>('hospital_cep')!;
  set hospitalCep(String value) => setField<String>('hospital_cep', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  String? get enderecoFormatado => getField<String>('endereco_formatado');
  set enderecoFormatado(String? value) =>
      setField<String>('endereco_formatado', value);

  String? get hospitalAvatar => getField<String>('hospital_avatar');
  set hospitalAvatar(String? value) =>
      setField<String>('hospital_avatar', value);
}
