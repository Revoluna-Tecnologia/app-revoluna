import '../database.dart';

class HospitaisTable extends SupabaseTable<HospitaisRow> {
  @override
  String get tableName => 'hospitais';

  @override
  HospitaisRow createRow(Map<String, dynamic> data) => HospitaisRow(data);
}

class HospitaisRow extends SupabaseDataRow {
  HospitaisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HospitaisTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get logradouro => getField<String>('logradouro')!;
  set logradouro(String value) => setField<String>('logradouro', value);

  String get numero => getField<String>('numero')!;
  set numero(String value) => setField<String>('numero', value);

  String get cidade => getField<String>('cidade')!;
  set cidade(String value) => setField<String>('cidade', value);

  String get bairro => getField<String>('bairro')!;
  set bairro(String value) => setField<String>('bairro', value);

  String get estado => getField<String>('estado')!;
  set estado(String value) => setField<String>('estado', value);

  String get pais => getField<String>('pais')!;
  set pais(String value) => setField<String>('pais', value);

  String get cep => getField<String>('cep')!;
  set cep(String value) => setField<String>('cep', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  String get enderecoFormatado => getField<String>('endereco_formatado')!;
  set enderecoFormatado(String value) =>
      setField<String>('endereco_formatado', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
