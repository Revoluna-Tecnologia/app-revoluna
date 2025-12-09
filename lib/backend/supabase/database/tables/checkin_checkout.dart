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

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get vagaId => getField<String>('vaga_id');
  set vagaId(String? value) => setField<String>('vaga_id', value);

  String? get medicoId => getField<String>('medico_id');
  set medicoId(String? value) => setField<String>('medico_id', value);

  DateTime? get checkin => getField<DateTime>('checkin');
  set checkin(DateTime? value) => setField<DateTime>('checkin', value);

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

  String? get checkinStatus => getField<String>('checkin_status');
  set checkinStatus(String? value) => setField<String>('checkin_status', value);

  String? get checkoutStatus => getField<String>('checkout_status');
  set checkoutStatus(String? value) =>
      setField<String>('checkout_status', value);

  String? get checkinAprovadoPor => getField<String>('checkin_aprovado_por');
  set checkinAprovadoPor(String? value) =>
      setField<String>('checkin_aprovado_por', value);

  DateTime? get checkinAprovadoEm => getField<DateTime>('checkin_aprovado_em');
  set checkinAprovadoEm(DateTime? value) =>
      setField<DateTime>('checkin_aprovado_em', value);

  String? get checkoutAprovadoPor => getField<String>('checkout_aprovado_por');
  set checkoutAprovadoPor(String? value) =>
      setField<String>('checkout_aprovado_por', value);

  DateTime? get checkoutAprovadoEm =>
      getField<DateTime>('checkout_aprovado_em');
  set checkoutAprovadoEm(DateTime? value) =>
      setField<DateTime>('checkout_aprovado_em', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);
}
