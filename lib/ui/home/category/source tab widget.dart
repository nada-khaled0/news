import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category/source%20name%20item.dart';
import 'package:news/ui/home/news/news%20widget.dart';
import 'package:news/utils/app%20colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourceList;

  SourceTabWidget({
    required this.sourceList,
  });

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  // NewsViewModel viewModel=NewsViewModel();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            dividerColor: AppColor.transparent,
            onTap: (index) {
              // viewModel.changeSelectedIndex(index);
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).indicatorColor,
            tabs: widget.sourceList.map((source) {
              return SourceNameItem(
                  source: source,
                  isSelected:
                      selectedIndex == widget.sourceList.indexOf(source));
            }).toList(),
          ),
          Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex])),
          //widget.sourceList[selectedIndex
        ],
      ),
    );
  }
}
