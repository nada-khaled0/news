import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news/api/api%20const.dart';
import 'package:news/api/end%20points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

@singleton
class ApiManager {
  // ApiManager._();
  // static ApiManager? _instance;
  // static ApiManager getInstance(){
  //   _instance ??= ApiManager._();
  //   return _instance!;
  // }
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=1ae7de1b0b2a4d8387c949b11a4e2e95
   */

  Future<SourceResponse?> getSource(String categoryId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstant.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

/*https://newsapi.org/v2/everything?q=bitcoin&apiKey=1ae7de1b0b2a4d8387c949b11a4e2e95*/

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstant.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
