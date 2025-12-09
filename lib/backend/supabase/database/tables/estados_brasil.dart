import '../database.dart';

class EstadosBrasilTable extends SupabaseTable<EstadosBrasilRow> {
  @override
  String get tableName => 'estados_brasil';

  @override
  EstadosBrasilRow createRow(Map<String, dynamic> data) =>
      EstadosBrasilRow(data);
}

class EstadosBrasilRow extends SupabaseDataRow {
  EstadosBrasilRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EstadosBrasilTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get sigla => getField<String>('sigla');
  set sigla(String? value) => setField<String>('sigla', value);

  String? get lista => getField<String>('lista');
  set lista(String? value) => setField<String>('lista', value);
}
