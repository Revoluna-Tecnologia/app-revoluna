import '../database.dart';

class VwVagasGradeInfoTable extends SupabaseTable<VwVagasGradeInfoRow> {
  @override
  String get tableName => 'vw_vagas_grade_info';

  @override
  VwVagasGradeInfoRow createRow(Map<String, dynamic> data) =>
      VwVagasGradeInfoRow(data);
}

class VwVagasGradeInfoRow extends SupabaseDataRow {
  VwVagasGradeInfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwVagasGradeInfoTable();

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  String? get gradeId => getField<String>('grade_id');
  set gradeId(String? value) => setField<String>('grade_id', value);

  String? get gradeNome => getField<String>('grade_nome');
  set gradeNome(String? value) => setField<String>('grade_nome', value);

  String? get gradeCor => getField<String>('grade_cor');
  set gradeCor(String? value) => setField<String>('grade_cor', value);
}
