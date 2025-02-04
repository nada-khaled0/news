import 'package:news/model/SourceResponse.dart';

abstract class SourceRepo {
  Future<SourceResponse?> getSource(String categoryId);
}
