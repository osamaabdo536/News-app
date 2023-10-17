import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manger.dart';
import 'package:flutter_news_app/model/sourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  //todo : hold data - handle logic

  List<Source>? sourceList;
  String? errorMessage;

  Future<void> getSourceByCategoryId(String categoryId) async {
    sourceList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManger.getSources(categoryId);
      if(response.status == 'error'){
        errorMessage = response.message;
      }else{
        sourceList = response.sources;
      }
    }catch(e){
      errorMessage = 'Error loading news list.';
    }
    notifyListeners();
  }
}