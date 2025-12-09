import '../database.dart';

class BeneficiosTable extends SupabaseTable<BeneficiosRow> {
  @override
  String get tableName => 'beneficios';

  @override
  BeneficiosRow createRow(Map<String, dynamic> data) => BeneficiosRow(data);
}

class BeneficiosRow extends SupabaseDataRow {
  BeneficiosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BeneficiosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
