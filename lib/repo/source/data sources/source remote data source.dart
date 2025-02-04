import '../../../model/SourceResponse.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSource(String categoryId);
}
