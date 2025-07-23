import '../database.dart';

class CheckinCheckoutTable extends SupabaseTable<CheckinCheckoutRow> {
  @override
  String get tableName => 'checkin_checkout';

  @override
  CheckinCheckoutRow createRow(Map<String, dynamic> data) =>
      CheckinCheckoutRow(data);
}

class CheckinCheckoutRow extends SupabaseDataRow {
  CheckinCheckoutRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CheckinCheckoutTable();

  int get index => getField<int>('index')!;
  set index(int value) => setField<int>('index', value);

  String? get vagasId => getField<String>('vagas_id');
  set vagasId(String? value) => setField<String>('vagas_id', value);

  String? get medicoId => getField<String>('medico_id');
  set medicoId(String? value) => setField<String>('medico_id', value);

  DateTime get checkin => getField<DateTime>('checkin')!;
  set checkin(DateTime value) => setField<DateTime>('checkin', value);

  DateTime? get checkout => getField<DateTime>('checkout');
  set checkout(DateTime? value) => setField<DateTime>('checkout', value);

  double? get checkinLatitude => getField<double>('checkin_latitude');
  set checkinLatitude(double? value) =>
      setField<double>('checkin_latitude', value);

  double? get checkinLongitude => getField<double>('checkin_longitude');
  set checkinLongitude(double? value) =>
      setField<double>('checkin_longitude', value);

  double? get checkoutLatitude => getField<double>('checkout_latitude');
  set checkoutLatitude(double? value) =>
      setField<double>('checkout_latitude', value);

  double? get checkoutLongitude => getField<double>('checkout_longitude');
  set checkoutLongitude(double? value) =>
      setField<double>('checkout_longitude', value);

  String? get checkinJustificativa => getField<String>('checkin_justificativa');
  set checkinJustificativa(String? value) =>
      setField<String>('checkin_justificativa', value);

  String? get checkoutJustificativa =>
      getField<String>('checkout_justificativa');
  set checkoutJustificativa(String? value) =>
      setField<String>('checkout_justificativa', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);
}
