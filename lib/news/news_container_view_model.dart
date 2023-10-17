import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manger.dart';
import 'package:flutter_news_app/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier{
  List<News>? newsList;
  String? errorMessage;

  Future<void> getNewsBySourceID(String sourceId) async {
    newsList = null;
    errorMessage = null;
    try{
      var response = await ApiManger.getNewsBySourceId(sourceId);
      if(response.status == 'error'){
        errorMessage = response.message;
      }else{
        newsList = response.articles;
      }
    }catch(e){
      errorMessage = 'Error loading source...';
    }
    notifyListeners();
  }
}