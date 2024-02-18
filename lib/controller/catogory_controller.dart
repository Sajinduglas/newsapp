import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class CategoryController extends ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "Business";

  late NewsModel newsModel;
  bool isloading = false;

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  void fetchData() async {
    isloading = false;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=a9558543587d4e379111c841647fd86c");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isloading = false;
    notifyListeners();
  }
}
