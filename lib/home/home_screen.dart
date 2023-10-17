import 'package:flutter/material.dart';
import 'package:flutter_news_app/category/category_details.dart';
import 'package:flutter_news_app/category/category_fragment.dart';
import 'package:flutter_news_app/home/home_drawer.dart';
import 'package:flutter_news_app/model/categoryDM.dart';
import 'package:flutter_news_app/my_theme.dart';
import 'package:flutter_news_app/search/seach.dart';
import 'package:flutter_news_app/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
         color: MyTheme.whiteColor,
           child: Image.asset('assets/images/pattern.png' ,
             height: double.infinity,
             width: double.infinity,
             fit: BoxFit.cover,
           ),
       ) ,
        Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMenuItem == HomeDrawer.settings ? 'Settings' :
            selectedCategory == null ? 'News App' : selectedCategory!.title ,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItem: onSideMenuItem),
          ),
          body: selectedMenuItem == HomeDrawer.settings ?
              SettingsTab()
              :
          selectedCategory == null ?
          CategoryFragment(onCategoryClick: onCategoryClick):
          CategoryDetails(category: selectedCategory!)
          ,
      ),
      ],
    );

  }

  CategoryDM? selectedCategory;

  void onCategoryClick(CategoryDM newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  int selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItem(int newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
