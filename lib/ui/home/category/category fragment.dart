import 'package:flutter/material.dart';
import 'package:news/model/category%20model.dart';
import 'package:news/utils/app%20colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [];
  Function onViewClicked;

  CategoryFragment({required this.onViewClicked});

  @override
  Widget build(BuildContext context) {
    categoriesList = CategoryModel.getCategoryList(false);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Good Morning\n Here is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Stack(
                        alignment: index % 2 == 0
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            child: Image.asset(categoriesList[index].imagePath),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.01,
                                vertical: height * 0.02),
                            child: ToggleSwitch(
                              customWidths: [width * 0.25, width * 0.15],
                              customWidgets: [
                                Text(
                                  'View All',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context).indicatorColor,
                                  ),
                                )
                              ],
                              cornerRadius: 20.0,
                              activeBgColors: [
                                [
                                  Theme.of(context).primaryColor,
                                ],
                                [AppColor.grey]
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: AppColor.grey,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex: 1,
                              totalSwitches: 2,
                              animate: true,
                              radiusStyle: true,
                              onToggle: (index1) {
                                print('switched to: $index1');
                                onViewClicked(categoriesList[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.02,
                    );
                  },
                  itemCount: categoriesList.length)),
        ],
      ),
    );
  }
}
