import 'dart:convert';

import 'package:flutter_news_app/api/api_constants.dart';
import 'package:flutter_news_app/model/NewsResponse.dart';
import 'package:flutter_news_app/model/sourceResponse.dart';
import 'package:http/http.dart' as http;
class ApiManger{
  static Future<SourceResponse> getSources(String categoryId)async{
    /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=eb0b2dcf95c1465bb4b55646450476d9
   */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,{
      'apiKey' : 'eb0b2dcf95c1465bb4b55646450476d9' ,
      'category' : categoryId
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId)async{
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=eb0b2dcf95c1465bb4b55646450476d9
     */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi, {
      'apikey' : 'eb0b2dcf95c1465bb4b55646450476d9',
      'sources' : sourceId,
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e ;
    }
  }
}