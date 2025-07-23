import '../database.dart';

class VwDistribuicaoEspecialidadesTable
    extends SupabaseTable<VwDistribuicaoEspecialidadesRow> {
  @override
  String get tableName => 'vw_distribuicao_especialidades';

  @override
  VwDistribuicaoEspecialidadesRow createRow(Map<String, dynamic> data) =>
      VwDistribuicaoEspecialidadesRow(data);
}

class VwDistribuicaoEspecialidadesRow extends SupabaseDataRow {
  VwDistribuicaoEspecialidadesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwDistribuicaoEspecialidadesTable();

  String? get especialidade => getField<String>('especialidade');
  set especialidade(String? value) => setField<String>('especialidade', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
