import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/my_theme.dart';
import '../model/NewsResponse.dart';

class NewsITem extends StatelessWidget {
  News news;
  NewsITem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.3,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),

          SizedBox(height: 10,),
          Text(news.author??'',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14,
              color: MyTheme.geryColor
            ),
          ),
          SizedBox(height: 10,),
          Text(news.title??'',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10,),
          Text(news.publishedAt??'',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14,
                color: MyTheme.geryColor
            ),
          ),
        ],
      ),
    );
  }
}
