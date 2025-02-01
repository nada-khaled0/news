import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api%20manager.dart';
import 'package:news/ui/home/category/cubit/source%20%20state.dart';

class SourceViewModel extends Cubit<SourceState> {
  SourceViewModel() : super(SourceLoadingState());

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSource(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
      } else if (response?.status == 'ok') {
        emit(SourceSuccessState(sourceList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
