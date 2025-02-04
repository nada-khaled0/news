import 'package:injectable/injectable.dart';
import 'package:news/api/api%20manager.dart';
import 'package:news/repo/source/data%20sources/source%20remote%20data%20source.dart';

import '../../../model/SourceResponse.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSource(String categoryId) async {
    var response = await apiManager.getSource(categoryId);
    return response;
  }
}
