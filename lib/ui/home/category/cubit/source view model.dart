import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/repo/source/repo/source%20repo.dart';
import 'package:news/ui/home/category/cubit/source%20%20state.dart';

@injectable
class SourceViewModel extends Cubit<SourceState> {
  SourceRepo sourceRepo;

  SourceViewModel({required this.sourceRepo}) : super(SourceLoadingState());

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepo.getSource(categoryId);
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
