import '../database.dart';

class WhatsappnumberTable extends SupabaseTable<WhatsappnumberRow> {
  @override
  String get tableName => 'whatsappnumber';

  @override
  WhatsappnumberRow createRow(Map<String, dynamic> data) =>
      WhatsappnumberRow(data);
}

class WhatsappnumberRow extends SupabaseDataRow {
  WhatsappnumberRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WhatsappnumberTable();

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get number => getField<String>('number');
  set number(String? value) => setField<String>('number', value);
}
