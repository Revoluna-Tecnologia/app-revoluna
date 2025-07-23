import '../database.dart';

class BannerMKTTable extends SupabaseTable<BannerMKTRow> {
  @override
  String get tableName => 'bannerMKT';

  @override
  BannerMKTRow createRow(Map<String, dynamic> data) => BannerMKTRow(data);
}

class BannerMKTRow extends SupabaseDataRow {
  BannerMKTRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BannerMKTTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get pageIndex => getField<int>('page index');
  set pageIndex(int? value) => setField<int>('page index', value);

  String? get imgpath => getField<String>('imgpath');
  set imgpath(String? value) => setField<String>('imgpath', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
