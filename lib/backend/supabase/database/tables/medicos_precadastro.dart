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

  String get medicoPrimeironome => getField<String>('medico_primeironome')!;
  set medicoPrimeironome(String value) =>
      setField<String>('medico_primeironome', value);

  String get medicoSobrenome => getField<String>('medico_sobrenome')!;
  set medicoSobrenome(String value) =>
      setField<String>('medico_sobrenome', value);

  String get medicoCrm => getField<String>('medico_crm')!;
  set medicoCrm(String value) => setField<String>('medico_crm', value);

  String? get medicoCpf => getField<String>('medico_cpf');
  set medicoCpf(String? value) => setField<String>('medico_cpf', value);

  String? get medicoEmail => getField<String>('medico_email');
  set medicoEmail(String? value) => setField<String>('medico_email', value);

  String? get medicoTelefone => getField<String>('medico_telefone');
  set medicoTelefone(String? value) =>
      setField<String>('medico_telefone', value);

  String? get medicoEspecialidade => getField<String>('medico_especialidade');
  set medicoEspecialidade(String? value) =>
      setField<String>('medico_especialidade', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get medicoEstado => getField<String>('medico_estado');
  set medicoEstado(String? value) => setField<String>('medico_estado', value);

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
