import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manger.dart';
import 'package:flutter_news_app/tabs/tab_container.dart';

import '../model/sourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'CategoryDetails';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App' ,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder<SourceResponse>(
          future: ApiManger.getSources(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }else if(snapshot.hasError){
              return Center(
                child: Column(
                  children: [
                    Text('Something went Wrong !', style: Theme.of(context).textTheme.titleMedium,),
                    ElevatedButton(
                        onPressed: (){
                          ApiManger.getSources();
                          setState(() {

                          });
                        },
                        child: Text('Try Again', style: Theme.of(context).textTheme.titleSmall,)
                    ),
                  ],
                ),
              );
            }
            if(snapshot.data?.status != 'ok'){
              return Column(
                children: [
                  Text(snapshot.data?.message ?? 'Something went wrong !', style: Theme.of(context).textTheme.titleMedium,),
                  ElevatedButton(
                      onPressed: (){
                        ApiManger.getSources();
                        setState(() {

                        });
                      },
                      child: Text('Try Again', style: Theme.of(context).textTheme.titleSmall,)
                  ),
                ],
              );
            }
            var sourceList = snapshot.data?.sources ?? [];
            return TabContainer(sourceList: sourceList);
          }
      ),
    );

  }
}
