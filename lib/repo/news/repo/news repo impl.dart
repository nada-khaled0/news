import 'package:injectable/injectable.dart';
import 'package:news/repo/news/data%20sources/news%20remote%20data%20source.dart';
import 'package:news/repo/news/repo/news%20repo.dart';

import '../../../model/NewsResponse.dart';

@Injectable(as: NewsRepo)
class NewsRepoImpl implements NewsRepo {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepoImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId);
  }
}
