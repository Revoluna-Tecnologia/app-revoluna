import '../database.dart';

class EstadosBrasilTable extends SupabaseTable<EstadosBrasilRow> {
  @override
  String get tableName => 'estadosBrasil';

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

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  String? get sigla => getField<String>('Sigla');
  set sigla(String? value) => setField<String>('Sigla', value);

  String? get lista => getField<String>('Lista');
  set lista(String? value) => setField<String>('Lista', value);
}
