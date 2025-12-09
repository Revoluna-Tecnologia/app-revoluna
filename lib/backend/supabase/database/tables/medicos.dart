import '../database.dart';

class MedicosTable extends SupabaseTable<MedicosRow> {
  @override
  String get tableName => 'medicos';

  @override
  MedicosRow createRow(Map<String, dynamic> data) => MedicosRow(data);
}

class MedicosRow extends SupabaseDataRow {
  MedicosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MedicosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get rqe => getField<String>('rqe');
  set rqe(String? value) => setField<String>('rqe', value);

  String? get genero => getField<String>('genero');
  set genero(String? value) => setField<String>('genero', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get rg => getField<String>('rg');
  set rg(String? value) => setField<String>('rg', value);

  String? get crm => getField<String>('crm');
  set crm(String? value) => setField<String>('crm', value);

  String? get nomeFaculdade => getField<String>('nome_faculdade');
  set nomeFaculdade(String? value) => setField<String>('nome_faculdade', value);

  String? get tipoFaculdade => getField<String>('tipo_faculdade');
  set tipoFaculdade(String? value) => setField<String>('tipo_faculdade', value);

  String? get primeiroNome => getField<String>('primeiro_nome');
  set primeiroNome(String? value) => setField<String>('primeiro_nome', value);

  String? get sobrenome => getField<String>('sobrenome');
  set sobrenome(String? value) => setField<String>('sobrenome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);

  String? get logradouro => getField<String>('logradouro');
  set logradouro(String? value) => setField<String>('logradouro', value);

  String? get numero => getField<String>('numero');
  set numero(String? value) => setField<String>('numero', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  String? get pais => getField<String>('pais');
  set pais(String? value) => setField<String>('pais', value);

  String? get cep => getField<String>('cep');
  set cep(String? value) => setField<String>('cep', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updateAt => getField<DateTime>('update_at');
  set updateAt(DateTime? value) => setField<DateTime>('update_at', value);

  String? get updateBy => getField<String>('update_by');
  set updateBy(String? value) => setField<String>('update_by', value);

  DateTime? get deleteAt => getField<DateTime>('delete_at');
  set deleteAt(DateTime? value) => setField<DateTime>('delete_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get totalPlantoes => getField<int>('total_plantoes');
  set totalPlantoes(int? value) => setField<int>('total_plantoes', value);

  String? get especialidadeId => getField<String>('especialidade_id');
  set especialidadeId(String? value) =>
      setField<String>('especialidade_id', value);

  int? get anoTerminoEspecializacao =>
      getField<int>('ano_termino_especializacao');
  set anoTerminoEspecializacao(int? value) =>
      setField<int>('ano_termino_especializacao', value);

  int? get anoFormatura => getField<int>('ano_formatura');
  set anoFormatura(int? value) => setField<int>('ano_formatura', value);

  bool? get trackingPrivacy => getField<bool>('tracking_privacy');
  set trackingPrivacy(bool? value) => setField<bool>('tracking_privacy', value);

  String? get especialidadeNome => getField<String>('especialidade_nome');
  set especialidadeNome(String? value) =>
      setField<String>('especialidade_nome', value);

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
