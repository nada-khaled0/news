import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news/repo/source/data%20sources/source%20offline%20data%20source.dart';

import '../../../model/SourceResponse.dart';

@Injectable(as: SourceOfflineDataSource)
class SourceOfflineDataSourceImpl implements SourceOfflineDataSource {
  @override
  Future<SourceResponse?> getSource(String categoryId) async {
    var box = await Hive.openBox('SourcesTab');
    return box.get(categoryId);
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String categoryId) async {
    var box = await Hive.openBox('SourcesTab');
    await box.put(categoryId, sourceResponse);
    await box.close();
  }
}
