import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/repo/news/repo/news%20repo.dart';
import 'package:news/ui/home/news/cubit/news%20states.dart';

@injectable
class NewsViewModel extends Cubit<NewsState> {
  NewsRepo newsRepo;

  NewsViewModel({required this.newsRepo}) : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepo.getNewsBySourceId(sourceId);
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
