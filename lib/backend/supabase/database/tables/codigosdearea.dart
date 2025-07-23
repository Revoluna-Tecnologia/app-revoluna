import '../database.dart';

class CodigosdeareaTable extends SupabaseTable<CodigosdeareaRow> {
  @override
  String get tableName => 'codigosdearea';

  @override
  CodigosdeareaRow createRow(Map<String, dynamic> data) =>
      CodigosdeareaRow(data);
}

class CodigosdeareaRow extends SupabaseDataRow {
  CodigosdeareaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CodigosdeareaTable();

  int get index => getField<int>('Index')!;
  set index(int value) => setField<int>('Index', value);

  String get pais => getField<String>('País')!;
  set pais(String value) => setField<String>('País', value);

  String? get codigo => getField<String>('Código');
  set codigo(String? value) => setField<String>('Código', value);

  String? get formato => getField<String>('Formato');
  set formato(String? value) => setField<String>('Formato', value);

  int? get caracteresMax => getField<int>('Caracteres Máx');
  set caracteresMax(int? value) => setField<int>('Caracteres Máx', value);

  String? get lista => getField<String>('Lista');
  set lista(String? value) => setField<String>('Lista', value);
}
