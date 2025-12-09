import '../database.dart';

class CodigosAreaTable extends SupabaseTable<CodigosAreaRow> {
  @override
  String get tableName => 'codigos_area';

  @override
  CodigosAreaRow createRow(Map<String, dynamic> data) => CodigosAreaRow(data);
}

class CodigosAreaRow extends SupabaseDataRow {
  CodigosAreaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CodigosAreaTable();

  int get index => getField<int>('index')!;
  set index(int value) => setField<int>('index', value);

  String get pais => getField<String>('pais')!;
  set pais(String value) => setField<String>('pais', value);

  String? get codigo => getField<String>('codigo');
  set codigo(String? value) => setField<String>('codigo', value);

  String? get formato => getField<String>('formato');
  set formato(String? value) => setField<String>('formato', value);

  int? get caracteresMax => getField<int>('caracteres_max');
  set caracteresMax(int? value) => setField<int>('caracteres_max', value);

  String? get lista => getField<String>('lista');
  set lista(String? value) => setField<String>('lista', value);
}
