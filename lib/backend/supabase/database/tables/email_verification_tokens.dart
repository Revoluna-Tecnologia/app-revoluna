import '../database.dart';

class EmailVerificationTokensTable
    extends SupabaseTable<EmailVerificationTokensRow> {
  @override
  String get tableName => 'email_verification_tokens';

  @override
  EmailVerificationTokensRow createRow(Map<String, dynamic> data) =>
      EmailVerificationTokensRow(data);
}

class EmailVerificationTokensRow extends SupabaseDataRow {
  EmailVerificationTokensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmailVerificationTokensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get token => getField<String>('token');
  set token(String? value) => setField<String>('token', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get firstname => getField<String>('firstname');
  set firstname(String? value) => setField<String>('firstname', value);

  String? get lastname => getField<String>('lastname');
  set lastname(String? value) => setField<String>('lastname', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);
}
