import 'package:flutter/material.dart';
import 'package:news/api/api%20manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/news/news%20item.dart';
import 'package:news/utils/app%20colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.grey,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text('SomeThing Went Wrong',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,),
                  ElevatedButton(onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
          }
          //server => error or success
          //in case error
          if (snapshot.data!.status == 'error') {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.message!,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,),
                  ElevatedButton(onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? '');
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
          }
          // in case success (last option)
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        }
    );
  }
}
