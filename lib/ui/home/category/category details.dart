import 'package:flutter/material.dart';
import 'package:news/api/api%20manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category%20model.dart';
import 'package:news/ui/home/category/source%20tab%20widget.dart';
import 'package:news/utils/app%20colors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSource(widget.category.id),
        builder: (context, snapshot) {
          //hanlde ui while loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color: AppColor.grey,
            ),);
          } else if (snapshot.hasError) { //error from me
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: () {
                  ApiManager.getSource(widget.category.id);
                  setState(() {

                  });
                },
                    child: Text('try again'))
              ],
            );
          }
          //response from server ====> maybe success or error
          //error
          if (snapshot.data!.status != 'ok') { //or status=='error'
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: () {
                  ApiManager.getSource(widget.category.id);
                },
                    child: Text('try again'))
              ],
            );
          }
          //succsee
          var sourceList = snapshot.data!.sources!;
          return SourceTabWidget(sourceList: sourceList);
        }
    );
  }
}
