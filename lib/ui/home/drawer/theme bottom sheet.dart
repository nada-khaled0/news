import 'package:flutter/material.dart';
import 'package:news/providers/theme%20provider.dart';
import 'package:news/utils/app%20styles.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: Text(
              'Dark',
              style: AppStyles.medium24Black,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: Text(
              'Light',
              style: AppStyles.medium24Black,
            ),
          ),
        ],
      ),
    );
  }
}
