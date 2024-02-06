import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class SearchScreenController extends ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=a9558543587d4e379111c841647fd86c");
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api failed");
        // Handle the failure case as needed.
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}