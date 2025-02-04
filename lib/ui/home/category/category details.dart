import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/di%20inject.dart';
import 'package:news/model/category%20model.dart';
import 'package:news/ui/home/category/cubit/source%20%20state.dart';
import 'package:news/ui/home/category/cubit/source%20view%20model.dart';
import 'package:news/ui/home/category/source%20tab%20widget.dart';
import 'package:news/utils/app%20colors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = getIt<SourceViewModel>();

  // CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  /* void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child:
          BlocBuilder<SourceViewModel, SourceState>(builder: (context, state) {
        if (state is SourceLoadingState) {
          //state is object from source loading state
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.grey,
            ),
          );
        } else if (state is SourceErrorState) {
          return Column(
            children: [
              Text(
                state.errorMessage,
                //state is object from source error state
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getSources(widget.category.id);
                  },
                  child: Text('try again'))
            ],
          );
        } else if (state is SourceSuccessState) {
          //state is object from source success state
          return SourceTabWidget(
            sourceList: state.sourceList,
          );
        }
        return Container();
      }),
    );

    /* ChangeNotifierProvider(
      create: (context)=> viewModel ,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context,viewModel,child){
            if(viewModel.errorMessage!= null){
              return Column(
                          children: [
                            Text(viewModel.errorMessage!,
                            style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            ElevatedButton(onPressed: () {
                              viewModel.getSources(widget.category.id);
                              setState(() {

                              });
                            },
                                child: Text('try again'))
                          ],
                        );
            } else if(viewModel.sourceList == null ){
              return const Center(child: CircularProgressIndicator(
                         color: AppColor.grey,),);
            }else{
              return SourceTabWidget(sourceList: viewModel.sourceList!);
            }
          }
      ),


      // child: FutureBuilder<SourceResponse?>(
      //     future: ApiManager.getSource(widget.category.id),
      //     builder: (context, snapshot) {
      //       //hanlde ui while loading
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(child: CircularProgressIndicator(
      //           color: AppColor.grey,
      //         ),);
      //       } else if (snapshot.hasError) { //error from me
      //         return Column(
      //           children: [
      //             Text('something went wrong'),
      //             ElevatedButton(onPressed: () {
      //               ApiManager.getSource(widget.category.id);
      //               setState(() {
      //
      //               });
      //             },
      //                 child: Text('try again'))
      //           ],
      //         );
      //       }
      //       //response from server ====> maybe success or error
      //       //error
      //       if (snapshot.data!.status != 'ok') { //or status=='error'
      //         return Column(
      //           children: [
      //             Text(snapshot.data!.message!),
      //             ElevatedButton(onPressed: () {
      //               ApiManager.getSource(widget.category.id);
      //             },
      //                 child: Text('try again'))
      //           ],
      //         );
      //       }
      //       //succsee
      //       var sourceList = snapshot.data!.sources!;
      //       return SourceTabWidget(sourceList: sourceList);
      //     }
      // ),
    );

      */
  }
}
