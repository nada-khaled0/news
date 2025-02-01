import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/providers/theme%20provider.dart';
import 'package:news/ui/home/home%20screen.dart';
import 'package:news/utils/app%20theme.dart';
import 'package:news/utils/my%20bloc%20observer.dart';
import 'package:provider/provider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(ChangeNotifierProvider(
      create: (context) => AppThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
