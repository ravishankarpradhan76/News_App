import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class ApiService {
  static const String _baseUrl =
      'https://newsdata.io/api/1/news?apikey=pub_71555d506dbb2bcfa27d85f3fcc93d3a22808&language=en';

  Future<List<Results>> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Results.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
