import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manger.dart';
import 'package:flutter_news_app/model/NewsResponse.dart';
import 'package:flutter_news_app/model/sourceResponse.dart';
import 'package:flutter_news_app/news/news_item.dart';

class NewsContainer extends StatefulWidget {
  Source source ;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManger.getNewsBySourceId(widget.source.id??''),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )
            );
          }else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text('Something went Wrong !', style: Theme.of(context).textTheme.titleMedium,),
                  ElevatedButton(
                      onPressed: (){
                        ApiManger.getNewsBySourceId(widget.source.id??'');
                        setState(() {

                        });
                      },
                      child: Text('Try Again', style: Theme.of(context).textTheme.titleSmall,)
                  ),
                ],
              ),
            );
          }if(snapshot.data?.status != 'ok'){
            return Center(child: Text(snapshot.data?.message??'Something went Wrong !', style: Theme.of(context).textTheme.titleMedium,));
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemBuilder: (context,index){
                return NewsITem(news: newsList[index]);
              },
              itemCount: newsList.length,
          );
        }
    );
  }
}
