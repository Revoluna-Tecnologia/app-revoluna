import '../database.dart';

class BannerMktTable extends SupabaseTable<BannerMktRow> {
  @override
  String get tableName => 'banner_mkt';

  @override
  BannerMktRow createRow(Map<String, dynamic> data) => BannerMktRow(data);
}

class BannerMktRow extends SupabaseDataRow {
  BannerMktRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BannerMktTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get pageIndex => getField<int>('page_index');
  set pageIndex(int? value) => setField<int>('page_index', value);

  String? get imgpath => getField<String>('imgpath');
  set imgpath(String? value) => setField<String>('imgpath', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
