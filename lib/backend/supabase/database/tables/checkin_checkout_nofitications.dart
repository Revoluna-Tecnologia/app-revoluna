import '../database.dart';

class CheckinCheckoutNofiticationsTable
    extends SupabaseTable<CheckinCheckoutNofiticationsRow> {
  @override
  String get tableName => 'checkin_checkout_nofitications';

  @override
  CheckinCheckoutNofiticationsRow createRow(Map<String, dynamic> data) =>
      CheckinCheckoutNofiticationsRow(data);
}

class CheckinCheckoutNofiticationsRow extends SupabaseDataRow {
  CheckinCheckoutNofiticationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CheckinCheckoutNofiticationsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get body => getField<String>('body')!;
  set body(String value) => setField<String>('body', value);

  String get recipientId => getField<String>('recipient_id')!;
  set recipientId(String value) => setField<String>('recipient_id', value);

  bool get isRead => getField<bool>('is_read')!;
  set isRead(bool value) => setField<bool>('is_read', value);

  String? get messageId => getField<String>('message_id');
  set messageId(String? value) => setField<String>('message_id', value);

  DateTime? get readAt => getField<DateTime>('read_at');
  set readAt(DateTime? value) => setField<DateTime>('read_at', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get route => getField<String>('route');
  set route(String? value) => setField<String>('route', value);

  dynamic? get extraData => getField<dynamic>('extra_data');
  set extraData(dynamic? value) => setField<dynamic>('extra_data', value);
}
