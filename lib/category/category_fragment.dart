import 'package:flutter/material.dart';
import 'package:flutter_news_app/category/category_item.dart';
import 'package:flutter_news_app/model/categoryDM.dart';
import 'package:flutter_news_app/my_theme.dart';

class CategoryFragment extends StatelessWidget {
  var categoryList = CategoryDM.getCategories();
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \n of interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoryList[index]);
                    },
                      child: CategoryItem(category: categoryList[index], index: index));
                },
                itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
