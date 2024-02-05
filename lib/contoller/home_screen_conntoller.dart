import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:share_plus/share_plus.dart';
import '../model/newsmodel.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isloading = false;
  

  fetchData()async{
    isloading =true;
    notifyListeners();
    final url =Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=a9558543587d4e379111c841647fd86c");
    final response =await http.get(url);

    print(response.statusCode);
    Map<String,dynamic>decodedata={}; ///map for storing
    if(response.statusCode==200){
      decodedata=jsonDecode(response.body);
    }else{
      print("api failed");
    }
    newsModel=NewsModel.fromJson(decodedata);
    isloading =false;
    notifyListeners();
  }

  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
  }

