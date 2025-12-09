import '../database.dart';

class GradesTable extends SupabaseTable<GradesRow> {
  @override
  String get tableName => 'grades';

  @override
  GradesRow createRow(Map<String, dynamic> data) => GradesRow(data);
}

class GradesRow extends SupabaseDataRow {
  GradesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GradesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get grupoId => getField<String>('grupo_id')!;
  set grupoId(String value) => setField<String>('grupo_id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String? get especialidadeId => getField<String>('especialidade_id');
  set especialidadeId(String? value) =>
      setField<String>('especialidade_id', value);

  String? get setorId => getField<String>('setor_id');
  set setorId(String? value) => setField<String>('setor_id', value);

  String? get hospitalId => getField<String>('hospital_id');
  set hospitalId(String? value) => setField<String>('hospital_id', value);

  String get cor => getField<String>('cor')!;
  set cor(String value) => setField<String>('cor', value);

  int? get horarioInicial => getField<int>('horario_inicial');
  set horarioInicial(int? value) => setField<int>('horario_inicial', value);

  dynamic? get configuracao => getField<dynamic>('configuracao');
  set configuracao(dynamic? value) => setField<dynamic>('configuracao', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  int? get ordem => getField<int>('ordem');
  set ordem(int? value) => setField<int>('ordem', value);
}
