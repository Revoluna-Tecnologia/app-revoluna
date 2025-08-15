import '../database.dart';

class EquipesTable extends SupabaseTable<EquipesRow> {
  @override
  String get tableName => 'equipes';

  @override
  EquipesRow createRow(Map<String, dynamic> data) => EquipesRow(data);
}

class EquipesRow extends SupabaseDataRow {
  EquipesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EquipesTable();

  String get equipesId => getField<String>('equipes_id')!;
  set equipesId(String value) => setField<String>('equipes_id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get grupoId => getField<String>('grupo_id')!;
  set grupoId(String value) => setField<String>('grupo_id', value);

  String get cor => getField<String>('cor')!;
  set cor(String value) => setField<String>('cor', value);

  String get updatedBy => getField<String>('updated_by')!;
  set updatedBy(String value) => setField<String>('updated_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
