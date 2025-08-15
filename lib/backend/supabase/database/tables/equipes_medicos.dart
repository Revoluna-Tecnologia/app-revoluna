import '../database.dart';

class EquipesMedicosTable extends SupabaseTable<EquipesMedicosRow> {
  @override
  String get tableName => 'equipes_medicos';

  @override
  EquipesMedicosRow createRow(Map<String, dynamic> data) =>
      EquipesMedicosRow(data);
}

class EquipesMedicosRow extends SupabaseDataRow {
  EquipesMedicosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EquipesMedicosTable();

  String? get equipesId => getField<String>('equipes_id');
  set equipesId(String? value) => setField<String>('equipes_id', value);

  String get medicoId => getField<String>('medico_id')!;
  set medicoId(String value) => setField<String>('medico_id', value);

  String get grupoId => getField<String>('grupo_id')!;
  set grupoId(String value) => setField<String>('grupo_id', value);

  String get updatedBy => getField<String>('updated_by')!;
  set updatedBy(String value) => setField<String>('updated_by', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get medicoPrecadastroId => getField<String>('medico_precadastro_id');
  set medicoPrecadastroId(String? value) =>
      setField<String>('medico_precadastro_id', value);
}
