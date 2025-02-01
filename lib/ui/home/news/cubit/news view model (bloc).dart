import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api%20manager.dart';
import 'package:news/ui/home/news/cubit/news%20states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
      } else {
        emit(NewsSuccessState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }

/* int changeSelectedIndex(int newIndex){

    emit(ChangeIndexState(selectedIndex: newIndex));
    return newIndex;
  }*/
}
