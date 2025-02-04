import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/di%20inject.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/news/cubit/news%20states.dart';
import 'package:news/ui/home/news/news%20item.dart';
import 'package:news/utils/app%20colors.dart';

import 'cubit/news view model .dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = getIt<NewsViewModel>();

  //NewsWidgetViewModel viewModel=NewsWidgetViewModel();

  /* @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??'');
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNewsBySourceId(widget.source.id ?? '');
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.grey,
            ),
          );
        } else if (state is NewsErrorState) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? '');
                  },
                      child: Text('Try Again',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge,),)
                  ],
                ),
              );
            }
            else if (state is NewsSuccessState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: state.newsList[index]);
                },
                itemCount: state.newsList.length,
              );
            }
            return Container();
          }
      ),
    );


    /*ChangeNotifierProvider(
      create: (context)=> viewModel,
      child:Consumer<NewsWidgetViewModel>(
          builder:(context,viewModel,child){
            if(viewModel.errorMessage!=null){
              return Center(
                            child: Column(
                              children: [
                                Text(viewModel.errorMessage!,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineLarge,),
                                ElevatedButton(onPressed: () {
                                  viewModel.getNewsBySourceId(widget.source.id??'');
                                  setState(() {

                                  });
                                },
                                  child: Text('Try Again',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headlineLarge,),)
                              ],
                            ),
                          );
            }else if(viewModel.newsList==null){
              return const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.grey,
                            ),
                          );
            }else{
              return ListView.builder(
                          itemBuilder: (context, index) {
                            return NewsItem(news: viewModel.newsList![index]);
                          },
                          itemCount: viewModel.newsList!.length,
                        );
            }

          }
      ),
      // FutureBuilder<NewsResponse>(
      //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(
      //             color: AppColor.grey,
      //           ),
      //         );
      //       } else if (snapshot.hasError) {
      //         return Center(
      //           child: Column(
      //             children: [
      //               Text('SomeThing Went Wrong',
      //                 style: Theme
      //                     .of(context)
      //                     .textTheme
      //                     .headlineLarge,),
      //               ElevatedButton(onPressed: () {
      //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
      //                 setState(() {
      //
      //                 });
      //               },
      //                 child: Text('Try Again',
      //                   style: Theme
      //                       .of(context)
      //                       .textTheme
      //                       .headlineLarge,),)
      //             ],
      //           ),
      //         );
      //       }
      //       //server => error or success
      //       //in case error
      //       if (snapshot.data!.status == 'error') {
      //         return Center(
      //           child: Column(
      //             children: [
      //               Text(snapshot.data!.message!,
      //                 style: Theme
      //                     .of(context)
      //                     .textTheme
      //                     .headlineLarge,),
      //               ElevatedButton(onPressed: () {
      //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
      //                 setState(() {
      //
      //                 });
      //               },
      //                 child: Text('Try Again',
      //                   style: Theme
      //                       .of(context)
      //                       .textTheme
      //                       .headlineLarge,),)
      //             ],
      //           ),
      //         );
      //       }
      //       // in case success (last option)
      //       var newsList = snapshot.data!.articles!;
      //       return ListView.builder(
      //         itemBuilder: (context, index) {
      //           return NewsItem(news: newsList[index]);
      //         },
      //         itemCount: newsList.length,
      //       );
      //     }
      // ),
    );*/
  }
}
