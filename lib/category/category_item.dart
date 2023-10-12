import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/categoryDM.dart';
import 'package:flutter_news_app/my_theme.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM category;
  int index;
  CategoryItem({required this.category , required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0),
          bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(category.image , height: MediaQuery.of(context).size.height*0.2,),
          Text(category.title , style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: MyTheme.whiteColor,
          ),),
        ],
      ),
    );
  }
}
