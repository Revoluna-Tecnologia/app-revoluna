import '../database.dart';

class WhatsappNumberTable extends SupabaseTable<WhatsappNumberRow> {
  @override
  String get tableName => 'whatsapp_number';

  @override
  WhatsappNumberRow createRow(Map<String, dynamic> data) =>
      WhatsappNumberRow(data);
}

class WhatsappNumberRow extends SupabaseDataRow {
  WhatsappNumberRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WhatsappNumberTable();

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get number => getField<String>('number');
  set number(String? value) => setField<String>('number', value);
}
