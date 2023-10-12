import 'package:flutter/material.dart';
import 'package:flutter_news_app/category/category_details.dart';
import 'package:flutter_news_app/home/home_screen.dart';
import 'my_theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        // CategoryDetails.routeName : (context) => CategoryDetails(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
