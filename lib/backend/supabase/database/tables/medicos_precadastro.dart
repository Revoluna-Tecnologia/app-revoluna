import '../database.dart';

class MedicosPrecadastroTable extends SupabaseTable<MedicosPrecadastroRow> {
  @override
  String get tableName => 'medicos_precadastro';

  @override
  MedicosPrecadastroRow createRow(Map<String, dynamic> data) =>
      MedicosPrecadastroRow(data);
}

class MedicosPrecadastroRow extends SupabaseDataRow {
  MedicosPrecadastroRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MedicosPrecadastroTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get primeiroNome => getField<String>('primeiro_nome')!;
  set primeiroNome(String value) => setField<String>('primeiro_nome', value);

  String get sobrenome => getField<String>('sobrenome')!;
  set sobrenome(String value) => setField<String>('sobrenome', value);

  String get crm => getField<String>('crm')!;
  set crm(String value) => setField<String>('crm', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get especialidadeId => getField<String>('especialidade_id');
  set especialidadeId(String? value) =>
      setField<String>('especialidade_id', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  String? get razaoSocial => getField<String>('razao_social');
  set razaoSocial(String? value) => setField<String>('razao_social', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  String? get bancoAgencia => getField<String>('banco_agencia');
  set bancoAgencia(String? value) => setField<String>('banco_agencia', value);

  String? get bancoDigito => getField<String>('banco_digito');
  set bancoDigito(String? value) => setField<String>('banco_digito', value);

  String? get bancoConta => getField<String>('banco_conta');
  set bancoConta(String? value) => setField<String>('banco_conta', value);

  String? get bancoPix => getField<String>('banco_pix');
  set bancoPix(String? value) => setField<String>('banco_pix', value);
}
