import '../database.dart';

class LocalMedicoTable extends SupabaseTable<LocalMedicoRow> {
  @override
  String get tableName => 'local_medico';

  @override
  LocalMedicoRow createRow(Map<String, dynamic> data) => LocalMedicoRow(data);
}

class LocalMedicoRow extends SupabaseDataRow {
  LocalMedicoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocalMedicoTable();

  String get localId => getField<String>('local_id')!;
  set localId(String value) => setField<String>('local_id', value);

  String get medicoId => getField<String>('medico_id')!;
  set medicoId(String value) => setField<String>('medico_id', value);
}
