import '../../../model/SourceResponse.dart';

abstract class SourceOfflineDataSource {
  Future<SourceResponse?> getSource(String categoryId);

  void saveSources(SourceResponse? sourceResponse, String categoryId);
}
