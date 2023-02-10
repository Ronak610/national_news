import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Screen/News/Modal/News_modal.dart';

class Apihttp {
  String apilink2 =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5144cf846a9042e19d8ab4a602d1bf10";

  Future<NewsModal?> getNews(String con) async {
    String apilink =
        "https://newsapi.org/v2/everything?q=$con&from=2023-01-29&to=2023-01-29&sortBy=popularity&apiKey=5144cf846a9042e19d8ab4a602d1bf10";
    var response = await http.get(Uri.parse(apilink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return NewsModal.fromJson(json);
    }
    return null;
  }
}
