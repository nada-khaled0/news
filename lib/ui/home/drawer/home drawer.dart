import 'package:flutter/material.dart';
import 'package:news/ui/home/drawer/drawer%20item.dart';
import 'package:news/utils/app%20colors.dart';
import 'package:news/utils/app%20styles.dart';
import 'package:news/utils/assets%20manager.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClicked;

  HomeDrawer({required this.onDrawerItemClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: AppColor.white,
          height: height * 0.18,
          child: Center(
              child: Text(
            'News App',
            style: AppStyles.bold24Black,
          )),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: () {
            //go to home screen
            onDrawerItemClicked();
          },
          child:
              DrawerItem(imagePath: AssetsManager.homeIcon, text: 'Go To Home'),
        ),
        Divider(
          color: AppColor.white,
          thickness: 2,
          indent: width * 0.04,
          endIndent: width * 0.06,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        DrawerItem(imagePath: AssetsManager.themeIcon, text: 'Theme'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColor.white,
              )
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          color: AppColor.white,
          thickness: 2,
          indent: width * 0.04,
          endIndent: width * 0.06,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        DrawerItem(imagePath: AssetsManager.languageIcon, text: 'Language'),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'English',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColor.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}
