import 'package:flutter/material.dart';
import 'package:news/utils/app%20colors.dart';
import 'package:news/utils/app%20styles.dart';

class DrawerItem extends StatelessWidget {
  String imagePath;
  String text;

  DrawerItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(imagePath),
            color: AppColor.white,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            text,
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
