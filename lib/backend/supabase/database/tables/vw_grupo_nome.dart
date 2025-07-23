import '../database.dart';

class VwGrupoNomeTable extends SupabaseTable<VwGrupoNomeRow> {
  @override
  String get tableName => 'vw_grupo_nome';

  @override
  VwGrupoNomeRow createRow(Map<String, dynamic> data) => VwGrupoNomeRow(data);
}

class VwGrupoNomeRow extends SupabaseDataRow {
  VwGrupoNomeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwGrupoNomeTable();

  String? get grupoId => getField<String>('grupo_id');
  set grupoId(String? value) => setField<String>('grupo_id', value);

  String? get grupoNome => getField<String>('grupo_nome');
  set grupoNome(String? value) => setField<String>('grupo_nome', value);
}
