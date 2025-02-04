import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/repo/source/data%20sources/source%20offline%20data%20source.dart';
import 'package:news/repo/source/data%20sources/source%20remote%20data%20source.dart';
import 'package:news/repo/source/repo/source%20repo.dart';

import '../../../model/SourceResponse.dart';

@Injectable(as: SourceRepo)
class SourceRepoImpl implements SourceRepo {
  SourceRemoteDataSource remoteDataSource;
  SourceOfflineDataSource offlineDataSource;

  SourceRepoImpl(
      {required this.remoteDataSource, required this.offlineDataSource});

  @override
  Future<SourceResponse?> getSource(String categoryId) async {
    final List<ConnectivityResult> connectivityResults =
        await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      var sourceResponse = await remoteDataSource.getSource(categoryId);
      offlineDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    } else {
      return offlineDataSource.getSource(categoryId);
    }
  }
}
