import '../database.dart';

class MedicosFavoritosTable extends SupabaseTable<MedicosFavoritosRow> {
  @override
  String get tableName => 'medicos_favoritos';

  @override
  MedicosFavoritosRow createRow(Map<String, dynamic> data) =>
      MedicosFavoritosRow(data);
}

class MedicosFavoritosRow extends SupabaseDataRow {
  MedicosFavoritosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MedicosFavoritosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get escalistaId => getField<String>('escalista_id')!;
  set escalistaId(String value) => setField<String>('escalista_id', value);

  String get medicoId => getField<String>('medico_id')!;
  set medicoId(String value) => setField<String>('medico_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);
}
