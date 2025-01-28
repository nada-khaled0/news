import 'package:flutter/material.dart';
import 'package:news/model/category%20model.dart';
import 'package:news/ui/home/category/category%20fragment.dart';
import 'package:news/ui/home/drawer/home%20drawer.dart';
import 'package:news/utils/app%20colors.dart';

import 'category/category details.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColor.black,
        child: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
      ),
      body: selectedCategory == null
          ? CategoryFragment(
              onViewClicked: onViewClicked,
            )
          : CategoryDetails(
              category: selectedCategory!,
            ),
    );
  }

  CategoryModel? selectedCategory;

  void onViewClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
